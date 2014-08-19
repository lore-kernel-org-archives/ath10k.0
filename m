Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJoNQ-0008Je-0v
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 18:43:24 +0000
Message-ID: <53F39AB3.10601@candelatech.com>
Date: Tue, 19 Aug 2014 11:42:59 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Timeout Issues
References: <CAD1M062MNW7y_hf+5btNA14xt9K69TqQy=Q-rCm+2xuHCZDEsA@mail.gmail.com>
In-Reply-To: <CAD1M062MNW7y_hf+5btNA14xt9K69TqQy=Q-rCm+2xuHCZDEsA@mail.gmail.com>
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
To: Pushpal Sidhu <psidhu@gateworks.com>
Cc: ath10k@lists.infradead.org

On 08/19/2014 11:27 AM, Pushpal Sidhu wrote:
> Hi,
> 
> I'm having issues with ath10k timing out when trying to communicate
> with the wireless card (UNEX DAXA-O1 + have tried several others).

Have you tried a WLE900 VX NIC?  Those have worked well for me.


> Below is what I grabbed from dmesg.
> 
> $ dmesg | grep ath10k
> [    5.233469] ath10k_pci 0000:09:00.0: enabling device (0140 -> 0142)
> [    5.575954] ath10k: pci irq legacy irq_mode 0 reset_mode 0
> [    7.704403] ath10k: failed to receive control response completion, polling..
> [    8.704379] ath10k: Service connect timeout: -110
> [    8.709089] ath10k: failed to connect htt (-110)
> [    9.020495] ath10k: could not init core (-110)
> [    9.324371] ath10k: could not probe fw (-110)
> 
> This causes the card to not be registered, and thus is unusable (there
> is no wlanX)
> 
> I am able to use the Intel 7260 card (another AC card) with their
> firmware binary blob, so I don't believe this is a hardware
> configuration issue with mini-pcie.
> 
> I am using the following software on an ARM board:
> ath10k branch of linux kernel: 3.16.0-wl-ath-182333-g6a69f0c
> latest git of hostapd
> latest git of iw
> latest git of wpa_supplicant
> 
> I have tried both firmware-2 binary blobs (the "AP" and "STA"
> versions) as well as the newer firmware-3 binary with the same exact
> messages being displayed.
> 
> Any help towards finding a solution is appreciated, thanks!

Probably this is not a firmware issue, but if you have nothing else
to try, you can try my version of the 10.1.x firmware:

http://www.candelatech.com/ath10k.php

and possibly my hacked 3.14.14 kernel, which may spew out some additional
debug info if you have something like OTP issues.

git clone git://dmz2.candelatech.com/linux-3.14.dev.y

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
