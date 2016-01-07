Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aH3IW-0000WE-C5
 for ath10k@lists.infradead.org; Thu, 07 Jan 2016 05:39:45 +0000
From: "Hsu, Ryan" <ryanhsu@qca.qualcomm.com>
Subject: RE: Qualcomm Atheros Device 0042 (rev 30)
Date: Thu, 7 Jan 2016 05:39:21 +0000
Message-ID: <11f83acf931f4ed38f078569eab59080@NALASEXR01G.na.qualcomm.com>
References: <568D6E4A.8050407@gmail.com>
In-Reply-To: <568D6E4A.8050407@gmail.com>
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
To: vagner <vagnerrener@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Can you try this firmware?

git clone https://github.com/kvalo/ath10k-firmware.git
sudo cp -r ./ath10k-firmware/QCA9377/ /lib/firmware/ath10k/
sudo ln -s /lib/firmware/ath10k/QCA9377/hw1.0/firmware-5.bin_WLAN.TF.1.0-00267-1 /lib/firmware/ath10k/QCA9377/hw1.0/firmware-5.bin

Otherwise a full dmesg log might be helpful to see what is the failure.

Ryan

> -----Original Message-----
> From: ath10k [mailto:ath10k-bounces@lists.infradead.org] On Behalf Of
> vagner
> Sent: Wednesday, January 06, 2016 11:43 AM
> To: ath10k@lists.infradead.org
> Subject: Qualcomm Atheros Device 0042 (rev 30)
> 
> I Have a new laptop:
> 
> Lenovo ideapad 300-15
> Intel i5 6th generation
> 
> Running Debian Stretch/Testing. And my wireless card does not work. I have
> tried all sort of solutions. Including compiling with backports.
> But, my kernel is new, using the same backports new version.
> How can I make this nightmare card work in my machine? Please, help.
> 
> uname -a
> 
>   4.3.0-1-amd64 #1 SMP Debian 4.3.3-2 (2015-12-17) x86_64 GNU/Linux
> 
> lspci
> > 02:00.0 Network controller: Qualcomm Atheros Device 0042 (rev 30)
> 
> lshw -C network
> 
> >  *-network UNCLAIMED
> >        description: Network controller
> >        product: Qualcomm Atheros
> >        vendor: Qualcomm Atheros
> >        physical id: 0
> >        bus info: pci@0000:02:00.0
> >        version: 30
> >        width: 64 bits
> >        clock: 33MHz
> >        capabilities: pm msi pciexpress bus_master cap_list
> >        configuration: latency=0
> >        resources: memory:a1000000-a11fffff
> 
> Thx
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
