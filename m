Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-out03.msg.oleane.net ([62.161.7.1])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XeOvn-0003Ck-EX
 for ath10k@lists.infradead.org; Wed, 15 Oct 2014 13:48:00 +0000
Received: from smtp28.msg.oleane.net (smtp28.mail.priv [172.17.20.150]) 
 by smtp-out03.msg.oleane.net with ESMTP id s9FDQKq4024330
 for <ath10k@lists.infradead.org>; Wed, 15 Oct 2014 15:26:20 +0200
From: "voncken" <cedric.voncken@acksys.fr>
References: <773DB8A82AB6A046AE0195C68612A319018C2750@sbs2003.acksys.local>	<CA+BoTQ=a8kY0CGGKHwRhk4cg=V0oimipuht6Pkc0K0x4WMMn-A@mail.gmail.com>	<024a01cfe6c7$5e427dd0$1ac77970$@acksys.fr>	<CA+BoTQkaKXNfprRwGrQq6rKOZWvANNRrcmgU-iVdw1bONTA--w@mail.gmail.com>	<025801cfe6de$2d4c7f70$87e57e50$@acksys.fr>
 <CACKGw+H1QSvAL0Ri3HT6E_rhw=DhzDwj1XEeqwjwFkzJVQpz9Q@mail.gmail.com>
In-Reply-To: <CACKGw+H1QSvAL0Ri3HT6E_rhw=DhzDwj1XEeqwjwFkzJVQpz9Q@mail.gmail.com>
Subject: RE: ath10k firmware crash
Date: Wed, 15 Oct 2014 15:05:09 +0200
Message-ID: <02f001cfe878$a64038e0$f2c0aaa0$@acksys.fr>
MIME-Version: 1.0
Content-Language: fr
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
To: 'Bartosz Markowski' <bartosz.markowski@tieto.com>
Cc: 'linux-wireless' <linux-wireless@vger.kernel.org>, 'Michal Kazior' <michal.kazior@tieto.com>, 'ath10k' <ath10k@lists.infradead.org>

> > I did some tests with a linksys WRT1900AC and I have ~950 mbps OTA easily.
> 
> You mean ath10k (STA) VS WRT1900AC get up ~950mbps?
> If so, could you say what's the HW, FW version you use?
> 
My test platform is one WRT1900AC set in bridge mode with a computer.

If I use the WRT1900AC in AP mode with another computer, I have 950 mbps
If I use the cavium octon III dev plateform + ath10k driver in AP mode, I have around 700 mbps

I'm using the latest compat wireless (2014-09-26) from openwrt.
The wireless card is the WLE900VX from compex or DAXA-O1 from Unex.

The WRT1900AC have mimo 4x4 with 3 streams, and my wireless card have mimo 3x3 with 3 streams. Maybe that explains the difference.

Cedric Voncken.
> --
> Bartosz
> --
> To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
> the body of a message to majordomo@vger.kernel.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
