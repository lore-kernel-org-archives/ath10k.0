Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from champagne.comp.nus.edu.sg ([137.132.80.90])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRrnh-0007k5-Rc
 for ath10k@lists.infradead.org; Tue, 26 Jul 2016 02:08:56 +0000
Received: from mail-it0-f71.google.com ([209.85.214.71])
 by champagne.comp.nus.edu.sg (Exim) with esmtps (TLSv1:DES-CBC3-SHA:168)
 id 1bRrnH-0001sO-9v
 for ath10k@lists.infradead.org; Tue, 26 Jul 2016 10:08:27 +0800
Received: by mail-it0-f71.google.com with SMTP id j124so229848464ith.1
 for <ath10k@lists.infradead.org>; Mon, 25 Jul 2016 19:08:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <loom.20160726T034139-557@post.gmane.org>
References: <loom.20160726T034139-557@post.gmane.org>
From: Raj Joshi <rajjoshi@comp.nus.edu.sg>
Date: Tue, 26 Jul 2016 10:07:45 +0800
Message-ID: <CA+uUJGudfwyqTjzwK2WVbMrd1czVPT4pM1J50ageGtRtBe644A@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_Fail_to_Capture_QOS_data_packets_in_Monitoring_m?=
 =?UTF-8?Q?ode_=2D_QCA988x=E2=80=8F=E2=80=8F?=
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
To: sdhrtht <sdhrtht@outlook.com>
Cc: ath10k <ath10k@lists.infradead.org>

Hi,

The following may not necessarily be your case. But since you
mentioned MGMT and CTRL packets are captured and not QoS data packets,
I observed a similar behavior when my configuration was as below:
* Sender: Operating 80Mhz dynamic channel width (secondary channel
either above or below primary channel, doesn't matter)
* Sniffer: Operating on 80MHz width. However, the sniffer's primary
channel doesn't overlap with the sender's primary channel; basically
they have different primary channels.

It is necessary that the primary channels of the sender and the
sniffer match. Otherwise, the sniffer is able to only see the non-HT
duplicate frames sent by the sender. This is because those frames are
sent on all the four 20MHz channels, one of which is your sniffer's
primary channel.

I am not sure if the greenfield configuration could be a culprit here.
But you might want to check the above first :)

Cheers,
Raj Joshi


On Tue, Jul 26, 2016 at 9:43 AM, sdhrtht <sdhrtht@outlook.com> wrote:
> ath10k monitor failing to capture data packets with WMM enabled on AP.
>
> AP Status: (when no QOS data Packets. MGMT and CTRL Packets are able to
> captured)
> 1) 0x03 (3) - Secondary channel is below Primary
> 2) 1 - any Channel width in secondary channel width
> 3) 1 - Use of RIFS permitted
> 4) 0x02 - Only HT STAs in the BSS, however there exists at least on 20Mhz
> STA
> 5) 0 - all Associated HT STAs are greenfield capable
>
> Tested with latest CT and non-CT firmware's.
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
