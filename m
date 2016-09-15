Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkWjy-0001Yd-Rz
 for ath10k@lists.infradead.org; Thu, 15 Sep 2016 13:30:17 +0000
Received: from [192.168.2.106] ([93.204.160.61]) by mail.gmx.com (mrgmx003)
 with ESMTPSA (Nemesis) id 0LvVYZ-1b29QO22GB-010aBv for
 <ath10k@lists.infradead.org>; Thu, 15 Sep 2016 15:29:47 +0200
From: Daniel Holz <daniel.holz91@gmx.de>
Subject: QCA6174 Performance
Message-ID: <3683ea4d-10ce-80a1-2e11-4b873f4129b8@gmx.de>
Date: Thu, 15 Sep 2016 15:29:47 +0200
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hello,

the network performance of the Qualcom QCA6174 in my Lenovo Yoga 3 11 is 
only around 7-8 Mbyte/s in tests with iperf when using a wireless ac 
connection. Disabling power management resulted in 10 MByte/s. Under the 
same conditions my Android phone achieved 384 MByte/s.

Currently I'm using Ubuntu 16.04 on my Yoga 3 11 with the most recent 
hw2.1 firmware and kernel 4.4. I already tried kernel 4.8 which boosted 
the speed to 15 MByte/s, but this is still way too slow for such a 
connection.


Thanks

Daniel Holz


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
