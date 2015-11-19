Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzSl7-0004ER-WC
 for ath10k@lists.infradead.org; Thu, 19 Nov 2015 17:12:35 +0000
References: <87mvuj585b.fsf@kamboji.qca.qualcomm.com>
 <1447826363-16818-1-git-send-email-michal.kazior@tieto.com>
 <1447826363-16818-10-git-send-email-michal.kazior@tieto.com>
 <564DE65C.9030407@dd-wrt.com> <564DEBBE.1040308@candelatech.com>
 <564DEC25.1030401@dd-wrt.com> <564DF53C.50009@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <564E02F1.3090306@dd-wrt.com>
Date: Thu, 19 Nov 2015 18:12:17 +0100
MIME-Version: 1.0
In-Reply-To: <564DF53C.50009@candelatech.com>
Subject: Re: QCA998X not working at all
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
To: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

Am 19.11.2015 um 17:13 schrieb Ben Greear:
>
> git clone git://dmz2.candelatech.com/linux.ath
same effect with yours

     6.201141] ath10k_pci 0000:01:00.0: enabling device (0140 -> 0142)
[    6.201593] ath10k_pci 0000:01:00.0: pci irq legacy interrupts 0 
irq_mode 0 reset_mode 0
[    8.578573] ath10k_pci 0000:01:00.0: unable to read from the device
[    8.578605] ath10k_pci 0000:01:00.0: could not execute otp for board 
id check: -110
[    8.583648] ath10k_pci 0000:01:00.0: failed to get board id from otp 
for qca99x0: -110
[    8.591338] ath10k_pci 0000:01:00.0: could not probe fw (-110)
[    8.600062] ath10k_pci 0001:01:00.0: enabling device (0140 -> 0142)
[    8.605600] ath10k_pci 0001:01:00.0: pci irq legacy interrupts 0 
irq_mode 0 reset_mode 0
[   10.798574] ath10k_pci 0001:01:00.0: unable to read from the device
[   10.798598] ath10k_pci 0001:01:00.0: could not execute otp for board 
id check: -110
[   10.803644] ath10k_pci 0001:01:00.0: failed to get board id from otp 
for qca99x0: -110
[   10.811346] ath10k_pci 0001:01:00.0: could not probe fw (-110)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
