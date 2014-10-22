Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgsxJ-0003DJ-Au
 for ath10k@lists.infradead.org; Wed, 22 Oct 2014 10:15:50 +0000
Received: by mail-pd0-f171.google.com with SMTP id ft15so3248295pdb.16
 for <ath10k@lists.infradead.org>; Wed, 22 Oct 2014 03:15:28 -0700 (PDT)
MIME-Version: 1.0
From: Okhwan Lee <ohlee@mwnl.snu.ac.kr>
Date: Wed, 22 Oct 2014 19:14:56 +0900
Message-ID: <CANzpp-=opT==PUf5FhWi_cbB91+RhWk+jB7M4bfUCqh2wzQA2A@mail.gmail.com>
Subject: Change channel bandwidth without iw command
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: linux-wireless@vger.kernel.org

Hi,

We are trying to implement a protocol to evaluate the performance our
algorithm using QCA9880.

To implement our protocol, a receiver have to change the bandwidth
when a Action frame (what we define) is successfully received.
We know that the QCA9880 can change bandwidth by using iw command in
monitor mode.
So, we use similar function path used by "iw dev set freq ..."
When the receiver detects the reception of the Action frame we call
"ieee80211_set_monitor_channel" at the end of ieee80211_rx as follows:

/*************** net/mac80211/rx.c ******************/

// receive action frame, change bandwidth 80 -> 20

                rtnl_lock(); //lock rtnetlink used in pre_doit of nl80211
                chandef = local->monitor_chandef; // copy current chandef
                chandef.width = NL80211_CHAN_WIDTH_20; // set bandwidth
                chandef.center_freq1 = 5180; // set center freq...
                ieee80211_set_monitor_channel(wiphy, &chandef);
                rtnl_unlock();

/********************************************************/

However, the receiver invokes kernel panic when receives the Action frame.
As fas as we know, the panic is occurred in ath10k_config_chan of
ath10k device driver.
To the best our knowledge, our implementation exploits same function
path of iw command in nl80211, cfg80211, mac80211 and ath10k.
Moreover, we confirm that the input parameters (wiphy, chandef) in our
implementation are identical to the parameters used by iw command.

Is there any reason why we cannot change bandwidth?
Of course, iw command work correctly.

If you have any idea to solve this, please let me know.

Thanks a lot for your reading.

Sincerely yours,

Okhwan Lee , Ph.D. student

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
