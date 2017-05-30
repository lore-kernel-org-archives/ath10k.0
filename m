Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFhQ6-0001Jq-NO
 for ath10k@lists.infradead.org; Tue, 30 May 2017 13:42:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k Issue with eduroam?
Date: Tue, 30 May 2017 13:42:20 +0000
Message-ID: <87wp8yo40s.fsf@kamboji.qca.qualcomm.com>
References: <CA+ssr=fOa4NfGyg0VOe7KW2W=nDAO0o6v_c=7LHx04Eqz80WUw@mail.gmail.com>
In-Reply-To: <CA+ssr=fOa4NfGyg0VOe7KW2W=nDAO0o6v_c=7LHx04Eqz80WUw@mail.gmail.com>	(Blair
 Robert Drummond's message of "Mon, 29 May 2017 21:30:59 -0400")
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
To: Blair Robert Drummond <bdrum047@uottawa.ca>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Blair Robert Drummond <bdrum047@uottawa.ca> writes:

> I'm having some trouble connecting to eduroam, and I think that ath10k
> is where this issue is. To be clear, the wireless *mostly* works, in
> that it has no issue with most wireless networks, but this specific
> network it doesn't behave on. When I blacklist ath10k_pci and use a
> usb wireless card, I can connect just fine, so I don't think it's a
> configuration issue. This is on a fresh install of Elementary OS
> (originally with kernel 4.8, but I upgraded to 4.10, though to no
> effect). A similar fresh install on a different computer doesn't
> suffer from this problem, and a void linux live image also has the
> same issue.
>
> So, I hope that I've successfully ruled out all other reasonable
> sources of error (though, admittedly I don't know what I'm doing). The
> eduroam network is a WPA2-Enterprise network with PEAP and MSCHAPv2.
> I'm attaching the output of dmesg, journalctl, lspci, and lsmod. The
> specific problem is that while I do "connect" I can't seem to pass any
> data 'ping -c 30 www.google.com' terminates with "unknown host" and
> browsers fail with "temporary failure in name resolution".
>

[...]

> I also noticed things like:
> kernel: ath10k_pci 0000:02:00.0: Direct firmware load for
> ath10k/pre-cal-pci-0000:02:00.0.bin failed with error -2
> kernel: ath10k_pci 0000:02:00.0: Direct firmware load for
> ath10k/cal-pci-0000:02:00.0.bin failed with error -2

You can ignore these warnings, they are fixed in
9f5bcfe93315d75da4cc46bd30b536966559359a and should not be related in
your problem in any way.

> [  333.396188] ath10k_pci 0000:02:00.0: no channel configured; ignoring frame(s)!
> [  337.696604] wlp2s0: authenticate with 00:1a:1e:bb:2a:29
> [  337.734058] wlp2s0: send auth to 00:1a:1e:bb:2a:29 (try 1/3)
> [  337.834610] wlp2s0: send auth to 00:1a:1e:bb:2a:29 (try 2/3)
> [  337.838398] wlp2s0: authenticated
> [ 337.838605] ath10k_pci 0000:02:00.0 wlp2s0: disabling HT as WMM/QoS
> is not supported by the AP
> [ 337.838607] ath10k_pci 0000:02:00.0 wlp2s0: disabling VHT as WMM/QoS
> is not supported by the AP
> [  337.842590] wlp2s0: associate with 00:1a:1e:bb:2a:29 (try 1/3)
> [ 337.855890] wlp2s0: RX AssocResp from 00:1a:1e:bb:2a:29 (capab=0x411
> status=0 aid=1)
> [  337.858372] wlp2s0: associated

From a quick look only suspicious I found was these disabling HT and VHT
messages. It might be that ath10k is not handling that case correctly.
Do you see these messages with ath10k when the connection works without
problems?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
