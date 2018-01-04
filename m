Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eX6fB-00015A-Mg
 for ath10k@lists.infradead.org; Thu, 04 Jan 2018 14:38:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Bad TCP performance on WLE900VX
Date: Thu, 4 Jan 2018 14:38:14 +0000
Message-ID: <87vagh7kq2.fsf@kamboji.qca.qualcomm.com>
References: <CALAE=UAPXYsCfO+QXxPsnEe2vkcMcCoknSAc8RVyOVk85MC-8Q@mail.gmail.com>
In-Reply-To: <CALAE=UAPXYsCfO+QXxPsnEe2vkcMcCoknSAc8RVyOVk85MC-8Q@mail.gmail.com>	(Robert
 Jones's message of "Tue, 2 Jan 2018 17:47:18 -0800")
Content-Language: en-US
MIME-Version: 1.0
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
To: Robert Jones <rjones@gateworks.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Robert Jones <rjones@gateworks.com> writes:

> Hello Everyone,
>
> I'm using a custom arm64 board with a Cavium CN8030 CPU and testing
> wireless card performance via iperf on Ubuntu 16.02 with a mainline
> 4.14 kernel. I have two identical units connected to each other via
> 60dB attenuators on all three channels. Channel is set to 161 VHT80.
>
> With UDP I see throughput upwards of 650Mbits/s, but TCP is
> ~24Mbits/s. That seemed odd so I did a little more testing. Switched
> to a 4.9 kernel and still saw the poor performance, but not with a
> 4.4. Before I went through the trouble of bisecting I thought to ask
> if there was something I was missing.
>
> I did come across this Ubuntu bug thread
> [https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1670041] which
> appeared to follow the same behavior I was seeing. Switched my TCP
> congestion algorithm to reno and saw throughput jump to >330Mbits/s.
> Cubic and BBR still ~24.
>
> My question now, is there a standing bug that I'm not aware of or
> could there be some sort of problem with my configuration that is
> being worked around with the reno algorithm?

There's now support in TCP stack (commit below) to workaround this issue
in ath10k. I tried to come up with a patch before holidays but didn't
make it, anyone willing to write one?

tcp: allow drivers to tweak TSQ logic
https://git.kernel.org/linus/3a9b76fd0db9f0d426533f96a68a62a58753a51e

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
