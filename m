Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eWY9T-0003U5-Cs
 for ath10k@lists.infradead.org; Wed, 03 Jan 2018 01:47:33 +0000
Received: by mail-qt0-x235.google.com with SMTP id g9so557098qth.9
 for <ath10k@lists.infradead.org>; Tue, 02 Jan 2018 17:47:20 -0800 (PST)
MIME-Version: 1.0
From: Robert Jones <rjones@gateworks.com>
Date: Tue, 2 Jan 2018 17:47:18 -0800
Message-ID: <CALAE=UAPXYsCfO+QXxPsnEe2vkcMcCoknSAc8RVyOVk85MC-8Q@mail.gmail.com>
Subject: Bad TCP performance on WLE900VX
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
To: ath10k@lists.infradead.org

Hello Everyone,

I'm using a custom arm64 board with a Cavium CN8030 CPU and testing
wireless card performance via iperf on Ubuntu 16.02 with a mainline
4.14 kernel. I have two identical units connected to each other via
60dB attenuators on all three channels. Channel is set to 161 VHT80.

With UDP I see throughput upwards of 650Mbits/s, but TCP is
~24Mbits/s. That seemed odd so I did a little more testing. Switched
to a 4.9 kernel and still saw the poor performance, but not with a
4.4. Before I went through the trouble of bisecting I thought to ask
if there was something I was missing.

I did come across this Ubuntu bug thread
[https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1670041] which
appeared to follow the same behavior I was seeing. Switched my TCP
congestion algorithm to reno and saw throughput jump to >330Mbits/s.
Cubic and BBR still ~24.

My question now, is there a standing bug that I'm not aware of or
could there be some sort of problem with my configuration that is
being worked around with the reno algorithm?

Thanks,
Robert Jones

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
