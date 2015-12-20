Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAfHI-0001hO-Ec
 for ath10k@lists.infradead.org; Sun, 20 Dec 2015 14:48:05 +0000
Subject: Re: Issue with QCA9980 initialization
References: <CAD1MEwcSoCvfcp1v8L4=Bu9rk08hJ4BXSVS83d3+0RRwzF292A@mail.gmail.com>
From: Felix Fietkau <nbd@openwrt.org>
Message-ID: <5676BF7F.8010701@openwrt.org>
Date: Sun, 20 Dec 2015 15:47:27 +0100
MIME-Version: 1.0
In-Reply-To: <CAD1MEwcSoCvfcp1v8L4=Bu9rk08hJ4BXSVS83d3+0RRwzF292A@mail.gmail.com>
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
To: Josh Bendavid <joshbendavid@gmail.com>, ath10k@lists.infradead.org

On 2015-12-17 13:10, Josh Bendavid wrote:
> I have a problem with QCA9980 initialization.
> 
> Hardware/software environment is a TP-Link Archer C2600 with Openwrt
> trunk + patches for the c2600.  (This device has two QCA9980
> controllers for simultaneous dual band operation)
> 
> Openwrt is currently populating the firmware files as follows
> 
> https://github.com/kvalo/ath10k-firmware/blob/69f955c3dd95d97c7c30960aa5c9852c80b85cc3/QCA99X0/hw2.0/boardData_AR900B_CUS239_5G_v2_001.bin
> -> /lib/firmware/ath10k/QCA99X0/hw2.0/board.bin
> 
> https://github.com/kvalo/ath10k-firmware/blob/69f955c3dd95d97c7c30960aa5c9852c80b85cc3/QCA99X0/hw2.0/firmware-5.bin_10.4.1.00030-1
> -> /lib/firmware/ath10k/QCA99X0/hw2.0/firmware-5.bin
> 
> https://www.codeaurora.org/cgit/quic/qsdk/oss/firmware/ath10k-firmware/plain/ath10k/QCA99X0/hw2.0/board-2.bin?id=ddcec9efd245da9365c474f513a855a55f3ac7fe
> -> /lib/firmware/ath10k/QCA99X0/hw2.0/board-2.bin
> 
> Then I am extracting (at hardware initialization time) the appropriate
> calibration data from the ART partition on the router flash
> 
> offset/count 4096/12064 -> /lib/firmware/ath10k/cal-pci-0000:01:00.0.bin
> offset/count 20480/12064 -> /lib/firmware/ath10k/cal-pci-0001:01:00.0.bin
> 
> Using ath10k as shipped with compat-wireless in openwrt trunk out of
> the box I get the output in attached nopatch.txt (and wireless is not
> functioning clearly)
> 
> Using instead the patch from
> http://lists.infradead.org/pipermail/ath10k/2015-November/006489.html
> 
> Then I get the output in attached patch.txt, and wireless is working
> correctly with both radios.
> 
> Is it a known problem?  Is there a mistake somewhere in how I am
> populating /lib/firmware, or is the applied patch the correct fix for
> the time being?
It's a known problem. ath10k has a bug where it needlessly tries to
extract the OTP board id and fetch data from board-2.bin (and fails if
it can't) even though it already has valid per-radio cal-data.

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
