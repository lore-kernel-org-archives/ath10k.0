Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wjgca-0004HQ-S5
 for ath10k@lists.infradead.org; Mon, 12 May 2014 03:09:45 +0000
Message-ID: <53703B61.3050305@candelatech.com>
Date: Sun, 11 May 2014 20:09:21 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Unicast packets stop being transmitted to a particular station,
 under load, when WPA2 is enabled
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
In-Reply-To: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
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
To: Avery Pennarun <apenwarr@gmail.com>, ath10k <ath10k@lists.infradead.org>



On 05/11/2014 06:57 PM, Avery Pennarun wrote:
> Version: 3.15-rc1 and ath10k-stable-3.11-8 (both via backports to kernel 3.2.26)
> Firmware: 10.1.467.2-1
>
> Steps:
> - Configure ath10k as AP on channel 149, width 80 MHz, WPA2 encryption
> - Connect my 2009 macbook
> - Start a ping of 8.8.8.8 in the background from my macbook
> - Generate some traffic.  The trigger varies, but running uTorrent or
> quickly opening a lot of background tabs in Chrome usually seems to
> set it off within a couple of minutes.  iperf and isoping don't seem
> to cause any trouble.
>
> Expected:
> - ping keeps pinging
>
> Actual:
> - tcpdump on the ath10k host shows ICMP requests coming in, and
> responses going out.
> - tcpdump on the macbook shows ICMP requests going out, but no
> responses coming back.
> - tcpdump -I (radiotap mode) on the macbook is a little hard to
> understand since it's encrypted, but it shows some packets coming out
> of the ath10k (broadcasts, I think) but no unicast packets to the
> macbook.
> - tcpdump on the macbook *does* show broadcast packets arriving.  For
> example, ARP requests and "ping -b 192.168.1.255" (my local subnet IP
> address) get through.
> - Disconnecting and then reconnecting the wifi on my macbook fixes the
> problem until it next triggers.
> - Other STAs connected to the AP are not affected when the one STA
> isn't able to communicate (although each one has the potential to
> trigger the problem)

Can you reproduce with any other type of station
device?

Also, have you tried sniffing with a third device to see if
the AP actually puts the ICMP responses on the air?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
