Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-am1on0613.outbound.protection.outlook.com
 ([2a01:111:f400:fe00::613]
 helo=emea01-am1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJTMO-00048R-0f
 for ath10k@lists.infradead.org; Thu, 05 Feb 2015 20:49:13 +0000
From: Conrad Kostecki <ck@conrad-kostecki.de>
Subject: AW: number of peers exceeded after a short time
Date: Thu, 5 Feb 2015 20:48:25 +0000
Message-ID: <DB3PR04MB0763C8FF582B19DE3E00951BE23B0@DB3PR04MB0763.eurprd04.prod.outlook.com>
References: <DB3PR04MB07635C33D735EFE6217C380FE2590@DB3PR04MB0763.eurprd04.prod.outlook.com>
 <CALhHN=pwZTZ3prHjyj95X7LGHzWWC_NcrvNmdLYy0YMgTrFpfA@mail.gmail.com>
 <CA+BoTQnJFn2oFw5Qcpp+L0YvG6h71ZaH3T=a1e1HscK+4m_fpQ@mail.gmail.com>
In-Reply-To: <CA+BoTQnJFn2oFw5Qcpp+L0YvG6h71ZaH3T=a1e1HscK+4m_fpQ@mail.gmail.com>
Content-Language: de-DE
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 7 January 2015 at 06:28, Janusz Dziedzic <janusz.dziedzic@tieto.com> wrote:
> On 6 January 2015 at 21:30, Conrad Kostecki <ck@conrad-kostecki.de> wrote:
>> Hi!
>>
>> I am using hostapd 2.3 with 2x ath10k (WLE900VX, FW 10.2). Kernel is 3.18.0.
>> Four SSIDs are being broadcasted. Two directly from ath10k and another two via a vif, based on the real ath10k-interfaces.
>> Two SSIDs are using WPA2 and two other are using WPA2-Enterprise.
>>
>> This problem started for me since upgrading vom Kernel 3.17.x (FW 10.1) to Kernel 3.18.0 (FW 10.2). When I downgrade, it happens much less..
>>
>> After a very short time, about 5-15 minutes, my dmesg is beeing logged full with those messages:
>> [2055815.205855] ath10k_pci 0000:0c:00.0: number of peers exceeded: peers number 127 (max peers 127)
>> [2055818.796016] ath10k_pci 0000:0c:00.0: number of peers exceeded: peers number 127 (max peers 127)
>> [2055822.392301] ath10k_pci 0000:0c:00.0: number of peers exceeded: peers number 127 (max peers 127)
>> [...]
>>
>> How is this possible? This is my private home router. I've only a few wifi devices.
>> I've noticed, that this problem mainly happens, when my Nokia Lumia 930 tries to connect with my WPA2-Enterprise network.
>>
>> Is this a ath10k problem, which is not correctly processing the peers or hostapd?

> I guess this might be ath10k issue. I'd love to get my hands on logs
> with debug_mask=0xffffff3f (ath10k_core parameter) though.

I am sorry, that I didn't answer so long.
My problem is solved. Those messages are not showing again.
It seemed to, that my soekris net6501 died and got some serious problems.
It was still booting, but some parts are working very strange.. like wifi.
After replacing the mainboard with a new one, ath10k is working perfectly fine with it.
No more errors with my Lumia.

> Perhaps Lumia randomizes its hw addr (though I doubt that).

No, it does not.

Cheers
Conrad
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
