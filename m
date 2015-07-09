Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from server14-mail.hostwhitelabel.com ([104.152.168.114]
 helo=server14.hostwhitelabel.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZDCYW-00048K-Tv
 for ath10k@lists.infradead.org; Thu, 09 Jul 2015 14:12:05 +0000
From: CACook@quantum-sci.com
Subject: Re: Buss Reset Problem
Date: Thu, 09 Jul 2015 07:11:41 -0700
Message-ID: <2921819.TX9FEibvXY@andromeda>
In-Reply-To: <CA+BoTQk1jn=jBNXhrCxy2s=6BzLW=jjTxBk+2Ha+y-PbFQkkMQ@mail.gmail.com>
References: <3969592.crxpsBTBQa@andromeda> <3319636.gBuGFxuZFH@andromeda>
 <CA+BoTQk1jn=jBNXhrCxy2s=6BzLW=jjTxBk+2Ha+y-PbFQkkMQ@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thursday 09 July 2015 15:46:55 Michal Kazior wrote:
> > So that's it for the Doodle Labs ACE-DB-3.  It went back yesterday -- doesn't work with Linux.
> 
> I think someone complained they couldn't get an XB design to work on
> some of their PCI-E hosts (some Atom laptop even refused to POST with
> the card if I recall correctly). Apparently there's an electrical
> quirk - or at least that was to conclusion back then.
> 
> 
> > It's not the buss reset problem as I patched quirks.c.
> 
> I wonder how much related this could be to Data Bus Error ath10k sees
> when doing cold resets sometimes. Maybe it's good to have the quirk
> fixup nonetheless? But I'm no PCI expert so what do I know.

Yes the problem is very early in boot.  In KVM guest almost right after Grub it says that PCIe address does not exist (or is not accessible), and sure enough I check it on the host and it's flipped to "Invalid header".  I have to reboot the _host_ to get the card back then.

The card has good specs but Doodle doesn't care about this problem, and I just don't have time to uselessly fiddle with it.





_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
