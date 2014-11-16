// 1/0 Knapsack problem

#include <iostream>
#include <cstdio>
#include <algorithm>
#include <vector>
#include <cstring>
#include <string>
#include <cstdlib>

using namespace std;

#define D(x) cout << #x " is " << x << endl

// N is the length of the CD
// T is the number of tracks (at most 20)
int N, T, songs[20], dp[21][1<<20];
bool picked[21][1<<20];

// dp[i][j] is how many space I'm wasting using the first i songs.
// dp[i][j] = min(f(i + 1, j) ,  f(i + 1, j - songs[i]))

int f(int index, int remT){
  if(dp[index][remT] != -1) return dp[index][remT];
  if(index == T) return dp[index][remT] = remT;
  if(remT == 0)  return dp[index][remT] = 0;
  int la_cojo = 1 << 30; // inf value

  if(remT - songs[index] >= 0)
    la_cojo = f(index + 1, remT - songs[index]);

  int no_la_cojo = f(index + 1, remT);
  picked[index][remT] = (la_cojo < no_la_cojo);
  return dp[index][remT] = min(la_cojo, no_la_cojo);
}

// Backtrack
void bt(int index, int remT, bool first = false){
  if(!first){ printf("%d ", songs[index]); }
  for(int i=index + 1;i<=T; ++i){
    int new_rem = remT - songs[index];
    if(picked[i][new_rem]){
      return bt(i, new_rem);
    }
  }
}

int main(){
  while(scanf("%d", &N) == 1){
    scanf("%d", &T);
    for(int i=0;i<T;++i){ scanf("%d", &songs[i]); }
    for(int i=0;i<=T;++i) for(int j = 0; j <= N;++j) {dp[i][j] = -1; picked[i][j] = false;}
    int res = f(0, N, true);
    bt(-1, N, true);
    printf("sum:%d\n", N-res);
  }
  return 0;
}