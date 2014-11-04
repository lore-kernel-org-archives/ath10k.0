Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlSZ6-0007Gi-Bd
 for ath10k@lists.infradead.org; Tue, 04 Nov 2014 01:05:44 +0000
From: Sujith Manoharan <sujith@msujith.org>
MIME-Version: 1.0
Message-ID: <21592.9895.190054.349562@gargle.gargle.HOWL>
Date: Tue, 4 Nov 2014 06:36:47 +0530
Subject: Re: [ath9k-devel] Support for killer n1525
In-Reply-To: <CAAmLN2bKERAoiAjpe-wtSC6xHEZqcNtEmPUZOpLfy03MNpYQGA@mail.gmail.com>
References: <CAAmLN2bKERAoiAjpe-wtSC6xHEZqcNtEmPUZOpLfy03MNpYQGA@mail.gmail.com>
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
To: Joris Guisson <joris.guisson@gmail.com>
Cc: ath9k-devel@lists.ath9k.org, ath10k@lists.infradead.org

Joris Guisson wrote:
> I recently purchased an MSI GT 72 gaming laptop with a killer n1525 wifi card
> in it. The wifi didn't work, so I took a look at the latest kernel release
> (3.18-rc3), and it seems there is no support in it for the card. I didn't find
> the PCI device id (0x003e) listed in any of the atheros drivers, the only
> killer related entries where in ath9k:
> 
> It may just be a matter of adding a new device ID entry in the table above, if
> the NIC more or less works like previous killer NIC's.

This card/HW is not supported by ath9k. I think work is ongoing to add
support for this HW family to ath10k.

Sujith

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
