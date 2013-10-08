Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x22a.google.com ([2607:f8b0:4001:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTdtu-0004bL-4d
 for ath10k@lists.infradead.org; Tue, 08 Oct 2013 20:29:02 +0000
Received: by mail-ie0-f170.google.com with SMTP id x13so21451029ief.29
 for <ath10k@lists.infradead.org>; Tue, 08 Oct 2013 13:28:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1381260511.2081.250.camel@joe-AO722>
References: <20131008184815.3778.52129.stgit@localhost6.localdomain6>
 <1381260511.2081.250.camel@joe-AO722>
Date: Tue, 8 Oct 2013 14:28:40 -0600
Message-ID: <CAErSpo66rdt7F6sem0G0dz7ieRbeJG2P98WNhQBKacF0TWuvFA@mail.gmail.com>
Subject: Re: remove unneeded semicolons
From: Bjorn Helgaas <bhelgaas@google.com>
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
To: Joe Perches <joe@perches.com>
Cc: linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Julia Lawall <julia.lawall@lip6.fr>, Kalle Valo <kvalo@qca.qualcomm.com>, Fengguang Wu <fengguang.wu@intel.com>

Thanks, Joe.  I picked up the drivers/pci changes below and will merge
them in the v3.13 merge window if nobody else does it first.

Bjorn


diff --git a/drivers/pci/proc.c b/drivers/pci/proc.c
index cdc7836..46d1378 100644
--- a/drivers/pci/proc.c
+++ b/drivers/pci/proc.c
@@ -222,7 +222,7 @@ static long proc_bus_pci_ioctl(struct file *file,
unsigned int cmd,
        default:
                ret = -EINVAL;
                break;
-       };
+       }

        return ret;
 }
diff --git a/drivers/pci/syscall.c b/drivers/pci/syscall.c
index e1c1ec5..24750a1 100644
--- a/drivers/pci/syscall.c
+++ b/drivers/pci/syscall.c
@@ -44,7 +44,7 @@ SYSCALL_DEFINE5(pciconfig_read, unsigned long, bus,
unsigned long, dfn,
        default:
                err = -EINVAL;
                goto error;
-       };
+       }

        err = -EIO;
        if (cfg_ret != PCIBIOS_SUCCESSFUL)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
