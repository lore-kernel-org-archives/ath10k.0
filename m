Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8jAk-00005l-81
 for ath10k@lists.infradead.org; Wed, 07 Jan 2015 05:28:47 +0000
Received: by mail-ig0-f177.google.com with SMTP id z20so779598igj.10
 for <ath10k@lists.infradead.org>; Tue, 06 Jan 2015 21:28:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <DB3PR04MB07635C33D735EFE6217C380FE2590@DB3PR04MB0763.eurprd04.prod.outlook.com>
References: <DB3PR04MB07635C33D735EFE6217C380FE2590@DB3PR04MB0763.eurprd04.prod.outlook.com>
Date: Wed, 7 Jan 2015 06:28:18 +0100
Message-ID: <CALhHN=pwZTZ3prHjyj95X7LGHzWWC_NcrvNmdLYy0YMgTrFpfA@mail.gmail.com>
Subject: Re: number of peers exceeded after a short time
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Conrad Kostecki <ck@conrad-kostecki.de>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 6 January 2015 at 21:30, Conrad Kostecki <ck@conrad-kostecki.de> wrote:
> Hi!
>
> I am using hostapd 2.3 with 2x ath10k (WLE900VX, FW 10.2). Kernel is 3.18.0.
> Four SSIDs are being broadcasted. Two directly from ath10k and another two via a vif, based on the real ath10k-interfaces.
> Two SSIDs are using WPA2 and two other are using WPA2-Enterprise.
>
> This problem started for me since upgrading vom Kernel 3.17.x (FW 10.1) to Kernel 3.18.0 (FW 10.2). When I downgrade, it happens much less..
>
> After a very short time, about 5-15 minutes, my dmesg is beeing logged full with those messages:
> [2055815.205855] ath10k_pci 0000:0c:00.0: number of peers exceeded: peers number 127 (max peers 127)
> [2055818.796016] ath10k_pci 0000:0c:00.0: number of peers exceeded: peers number 127 (max peers 127)
> [2055822.392301] ath10k_pci 0000:0c:00.0: number of peers exceeded: peers number 127 (max peers 127)
> [...]
>
> How is this possible? This is my private home router. I've only a few wifi devices.
> I've noticed, that this problem mainly happens, when my Nokia Lumia 930 tries to connect with my WPA2-Enterprise network.
>
> Is this a ath10k problem, which is not correctly processing the peers or hostapd?

I suspect Michal already fix this,
ath10k: fix station count enforcement

Best use kernel from ath10k github.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
