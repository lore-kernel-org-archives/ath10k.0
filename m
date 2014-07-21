Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Sun, 20 Jul 2014 21:18:13 -0700 (PDT)
Message-Id: <20140720.211813.942862864883062133.davem@davemloft.net>
Subject: Re: [PATCH 0/25] Replace DEFINE_PCI_DEVICE_TABLE macro use
From: David Miller <davem@davemloft.net>
In-Reply-To: <1405697232-11785-1-git-send-email-benoit.taine@lip6.fr>
References: <1405697232-11785-1-git-send-email-benoit.taine@lip6.fr>
Mime-Version: 1.0
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
To: benoit.taine@lip6.fr
Cc: linux-mips@linux-mips.org, linux-fbdev@vger.kernel.org, linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, ath5k-devel@venema.h4ckr.net, linux-acenic@sunsite.dk, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, ath10k@lists.infradead.org, linux-hippi@sunsite.dk, industrypack-devel@lists.sourceforge.net, linux-mmc@vger.kernel.org, MPT-FusionLinux.pdl@avagotech.com, virtualization@lists.linux-foundation.org, ath9k-devel@venema.h4ckr.net, wil6210@qca.qualcomm.com, linux-pcmcia@lists.infradead.org, linux-can@vger.kernel.org, xen-devel@lists.xenproject.org, platform-driver-x86@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, users@rt2x00.serialmonkey.com, e1000-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org, devel@linuxdriverproject.org

From: Benoit Taine <benoit.taine@lip6.fr>
Date: Fri, 18 Jul 2014 17:26:47 +0200

> We should prefer `const struct pci_device_id` over
> `DEFINE_PCI_DEVICE_TABLE` to meet kernel coding style guidelines.
> This issue was reported by checkpatch.
> 
> A simplified version of the semantic patch that makes this change is as
> follows (http://coccinelle.lip6.fr/):
> 
> // <smpl>
> 
> @@
> identifier i;
> declarer name DEFINE_PCI_DEVICE_TABLE;
> initializer z;
> @@
> 
> - DEFINE_PCI_DEVICE_TABLE(i)
> + const struct pci_device_id i[]
> = z;
> 
> // </smpl>
> 
> I have 103 patches ready, and will only send a few for you to judge if
> it is useful enough, and to prevent from spamming too much.

I'm fine with this wrt. the networking changes, but I don't think this should
be merged via my tree.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
