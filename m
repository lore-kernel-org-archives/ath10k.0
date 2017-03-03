Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot0-x236.google.com ([2607:f8b0:4003:c0f::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjo4f-0001VK-4X
 for ath10k@lists.infradead.org; Fri, 03 Mar 2017 14:20:50 +0000
Received: by mail-ot0-x236.google.com with SMTP id 19so3547068oti.0
 for <ath10k@lists.infradead.org>; Fri, 03 Mar 2017 06:20:27 -0800 (PST)
MIME-Version: 1.0
From: Chris Price <chris.price@dejero.com>
Date: Fri, 3 Mar 2017 09:20:26 -0500
Message-ID: <CALJ2kaE1RTLPJJZZAx39wopeM2ohNPgeHAKb8bYXHQtWxCF9iA@mail.gmail.com>
Subject: Re: 4.9 Kernel panic on ACS and intermittent ability to host AP
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

> For the rest of the response, I'm back to using the old firmware. In
> addition, I tried not setting the skip_otp option and I seem to be
> able to get it working, so this is probably some bad advice I found
> somewhere on the web.

This seems to have been a fluke as I'm back to getting kernel panics
on a vanilla 4.9 kernel with the firmware from kernel.org. The panic
looks the same as before. Reception is still good.

I'm not sure it's relevant, but I'm connecting the card via a M.2 to
mini PCIe adapter. I've tried multiple adapters and with multiple
cards, and the adapters themselves seem to be working okay.

> * #{ managed } <= 2, #{ P2P-client } <= 2, #{ AP, mesh point, P2P-GO }
> <= 1, #{ P2P-device } <= 1,
>   total <= 4, #channels <= 2
>
> Maybe I misunderstand the output, but I would expect to be able to
> host two access points simultaneously.

I do misunderstand the output: *#{ AP, mesh point, P2P-GO } <= 1*. Derp.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
