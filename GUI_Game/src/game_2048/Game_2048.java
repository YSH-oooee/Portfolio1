package game_2048;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Random;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
//점수판, 게임 종료 시 작동 안함
class Num_color2 {
	
	Color c0 = new Color(238, 238, 238);	//0
	Color c1 = new Color(158, 113, 100);	//2
	Color c2 = new Color(143, 89, 97);		//4
	Color c3 = new Color(119, 89, 112);		//8
	Color c4 = new Color(79, 61, 81);		//16
	Color c5 = new Color(82, 66, 78);		//32
	Color c6 = new Color(60, 66, 82);		//64
	Color c7 = new Color(74, 82, 103);		//128
	Color c8 = new Color(75, 100, 127);		//256
	Color c9 = new Color(125, 151, 180);	//512
	Color c10 = new Color(159, 172, 189);	//1024
	Color c11 = new Color(188, 165, 174);	//2048
	
}

class Main_panel extends JPanel implements ActionListener {
	
	Random ran = new Random();
	
	final int SIZE = 4;		//칸 개수
	final int GOAL = 2048;	//목표 숫자
	
	int[][] data = new int[SIZE][SIZE];	//각 칸의 숫자
	int score = 0;		//점수
	int highest = 0;	//최고 점수
	
	JLabel score_LB = new JLabel("score");
	JLabel highest_LB = new JLabel("best");
	
	JLabel[][] num_LB = new JLabel[SIZE][SIZE];	//각 칸
	
	JButton reset = new JButton("reset");
	JButton up = new JButton("↑");
	JButton down = new JButton("↓");
	JButton left = new JButton("←");
	JButton right = new JButton("→");
	
	Main_panel() {
		
		setLayout(null);
		init();
		
	}
	
	//초기화(각 요소들 배치 및 설정, 랜덤 숫자 출현)
	public void init() {
		
		//점수판, 최고점수판
		Font font = new Font("", Font.BOLD, 15);		
		
		score_LB.setBounds(50, 20, 120, 70);
		score_LB.setOpaque(true);
		score_LB.setBackground(Color.RED);
		score_LB.setFont(font);
		score_LB.setForeground(Color.white);
		score_LB.setHorizontalAlignment(JLabel.CENTER);
		score_LB.setVerticalAlignment(JLabel.TOP);
		add(score_LB);
		
		highest_LB.setBounds(180, 20, 120, 70);
		highest_LB.setOpaque(true);
		highest_LB.setBackground(Color.RED);
		highest_LB.setFont(font);
		highest_LB.setForeground(Color.white);
		highest_LB.setHorizontalAlignment(JLabel.CENTER);
		highest_LB.setVerticalAlignment(JLabel.TOP);
		add(highest_LB);		
		
		//각 칸
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				
				num_LB[j][i] = new JLabel();
				num_LB[j][i].setBounds((50 + (i * 100)) + (i * 10), 
						(120 + (j * 100)) + (j * 10), 
						100, 100);
				add(num_LB[j][i]);
				
			}
		}
		
		//방향키버튼
		up.setBounds(650, 200, 100, 100);
		add(up);
		up.addActionListener(this);
		
		down.setBounds(650, 300, 100, 100);
		add(down);
		down.addActionListener(this);
		
		left.setBounds(550, 300, 100, 100);
		add(left);
		left.addActionListener(this);
		
		right.setBounds(750, 300, 100, 100);
		add(right);
		right.addActionListener(this);
		
		//리셋버튼
		font = new Font("", Font.BOLD, 20);
		
		reset.setBounds(380, 30, 100, 50);
		reset.setFont(font);
		reset.setForeground(Color.WHITE);
		reset.setBackground(Color.blue);
		reset.addActionListener(this);
		add(reset);
		
		while (true) {
			
			int x = ran.nextInt(SIZE);
			int y = ran.nextInt(SIZE);
			
			if (data[x][y] == 0) {
				data[x][y] = 2;
				break;
			}
			
		}
		
		random();
		
	}
	
	//랜덤 숫자 출현(dd)
	public void random() {
		
		if (check_win() == 0) {
			
			while (true) {
				
				int x = ran.nextInt(SIZE);
				int y = ran.nextInt(SIZE);
				
				if (data[x][y] == 0) {
					data[x][y] = 2;
					break;
				}
				
			}
			
		} else if (check_win() == 1) {
			System.out.println("완성!");
		} else if (check_win() == -1) {
			System.out.println("GameOver!");
		}
		
	}
	
	//각 칸의 값
	public void dataText() {
		
		for (int i = 0; i < data.length; i++) {
			for (int j = 0; j < data.length; j++) {				
				if (data[i][j] != 0) {
					num_LB[j][i].setText(data[i][j] + "");
				}
				if (data[i][j] == 0) {
					num_LB[j][i].setText(null);
				}
			}
		}
		
	}
	
	//게임 승패 확인
	public int check_win() {
		
		int check_win = 0;	//0(게임진행) 1(목표도달) -1(빈칸없음)
		int check = 0;
		boolean goal_check = false;
		
		//빈칸 확인, 목표 도달 확인
		for (int i = 0; i < data.length; i++) {
			for (int j = 0; j < data.length; j++) {
				
				if (data[i][j] != 0) {
					check++;
				}
				if (data[i][j] == 2048) {
					goal_check = true;
				}
				
			}
		}
		
		if (goal_check) {
			check_win = 1;
		}
		
		if (check == 16) {
			check_win = -1;
		}
		
		return check_win;
		
	}
		
	//다시 시작
	public void reset() {
		
		score = 0;
		
		for (int i = 0; i < data.length; i++) {
			for (int j = 0; j < data.length; j++) {
				num_LB[j][i].setText(null);
				data[i][j] = 0;
			}
		}
		
		init();
		
	}
	
	public void sum(int num) {
		//up
		if(num == 1) {
			for(int i = 0; i < SIZE - 1; i++) {
				for(int j = 0; j < SIZE; j++) {
					if(data[j][i] == data[j][i + 1]) {
						data[j][i] *= 2;
						data[j][i + 1] = 0;
					}
				}
			}
		}
		//down
		if(num == 2) {
			int k = 3;
			for(int i = 0; i < SIZE - 1; i++) {
				for(int j = 0; j < SIZE; j++) {
					if(data[j][k] == data[j][k - 1]) {
						data[j][k] *= 2;
						data[j][k - 1] = 0;
					}
				}
				k--;
			}
		}
		//left
		if(num == 3) {
			for(int i = 0; i < SIZE - 1; i++) {
				for(int j = 0; j < SIZE; j++) {
					//아래칸과 값이 같다면
					if(data[i][j] == data[i + 1][j]) {
						data[i][j] *= 2;
						data[i + 1][j] = 0;
					}
				}
			}		
		}
		//right
		if(num == 4) {
			int k = 3;	//마지막 열부터 시작
			for(int i = 0; i < SIZE - 1; i++) {
				for(int j = 0; j < SIZE; j++) {
					if(data[k][j] == data[k - 1][j]) {
						data[k][j] *= 2;
						data[k - 1][j] = 0;
					}
				}
				k--;	//바로 위의 열로 올라가 다시 검사
			}	
		}
	}
	
	//움직이는 방향에 따른 data값의 이동
	public void move(int num) {
		
		for(int i = 0; i < SIZE; i++) {
			//up
			if(num == 1) {
				int check = 0;
				for(int j = 0; j < 4; j++) {
					if(data[i][j] != 0) {
						data[i][check] = data[i][j];
						if(check != j) {
							data[i][j] = 0;
						}
						check++;
					}
				}
			}
			//down
			if(num == 2) {
				int check = 3;
				int k = 3;
				for(int j = 0; j < 4; j++) {
					if(data[i][k] != 0) {
						data[i][check] = data[i][k];
						if(check != k) {
							data[i][k] = 0;
						}
						check--;
					}
					k--;
				}
			}
			
			//left
			if(num == 3) {
				int check = 0;
				for(int j = 0; j < 4; j++) {
					if(data[j][i] != 0 ) {
						data[check][i] = data[j][i];
						if(check != j) {
							data[j][i] = 0;
						}
						check += 1;
					}					
				}
			}
			
			//right
			if(num == 4) {
				int check = 3;
				int k = 3;
				for(int j = 0; j < 4; j++) {
					if(data[k][i] != 0) {
						data[check][i] = data[k][i];
						if(check != k) {
							data[k][i] = 0;
						}
						check--;
					}
					k--;
				}
			}
			
		}
		dataText();	//각 버튼에 숫자 표시
	}
	
	protected void paintComponent(Graphics g) {
		
		super.paintComponent(g);
		
		try {
			Thread.sleep(100);
			repaint();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//점수(숫자)
		
		//큰사각(기본)
		g.setColor(new Color(245, 245, 245));
		g.fillRoundRect(40, 110, 450, 450, 10, 10);
		
		//숫자칸
		Num_color2 nc = new Num_color2();
		
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {

				if (data[i][j] == 0) {
					g.setColor(nc.c0);
				} else if (data[i][j] == 2) {
					g.setColor(nc.c1);
				} else if (data[i][j] == 4) {
					g.setColor(nc.c2);
				} else if (data[i][j] == 8) {
					g.setColor(nc.c3);
				} else if (data[i][j] == 16) {
					g.setColor(nc.c4);
				} else if (data[i][j] == 32) {
					g.setColor(nc.c5);
				} else if (data[i][j] == 64) {
					g.setColor(nc.c6);
				} else if (data[i][j] == 128) {
					g.setColor(nc.c7);
				} else if (data[i][j] == 256) {
					g.setColor(nc.c8);
				} else if (data[i][j] == 512) {
					g.setColor(nc.c9);
				} else if (data[i][j] == 1024) {
					g.setColor(nc.c10);
				} else if (data[i][j] == 2048) {
					g.setColor(nc.c11);
				}
				
				g.fillRoundRect((50 + (i * 100)) + (i * 10), 
								(120 + (j * 100)) + (j * 10), 
								100, 100, 10, 10);
				
				//각 칸의 숫자 출력
				Font font = new Font("", Font.BOLD, 25);
				num_LB[j][i].setFont(font);
				num_LB[j][i].setForeground(Color.white);
				num_LB[j][i].setHorizontalAlignment(JLabel.CENTER);
				dataText();
				
			}
		}
		
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		
		if (e.getSource() == reset) {
			reset();
		} else if (e.getSource() == up) {
			//move_up();
			move(1);
			sum(1);
			move(1);
			random();
		} else if (e.getSource() == down) {
			//move_down();
			move(2);
			sum(2);
			move(2);
			random();
		} else if (e.getSource() == left) {
			//move_left();
			move(3);
			sum(3);
			move(3);
			random();
		} else if (e.getSource() == right) {
			//move_right();
			move(4);
			sum(4);
			move(4);
			random();
		}
		System.out.println("-----------");
		for (int i = 0; i < data.length; i++) {
			for (int j = 0; j < data.length; j++) {
				System.out.print(data[j][i] + " ");
			}
			System.out.println();
		}
		
	}
	
}

public class Game_2048 {
	
	public static void main(String[] args) {
		
		final int width = 950;
		final int height = 650;
		
		Dimension screensize = Toolkit.getDefaultToolkit().getScreenSize();
		final int x = (screensize.width/2) - (width/2);
		final int y = (screensize.height/2) - (height/2);
		
		JFrame frame = new JFrame();
		frame.setTitle("2048");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
		frame.setBounds(x, y, width, height);
		
		Main_panel mp = new Main_panel();
		frame.setContentPane(mp);
		frame.revalidate();
		
	}
}
