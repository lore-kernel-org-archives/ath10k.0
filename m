Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x232.google.com ([2607:f8b0:4001:c05::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W4GXV-0005gP-Ej
 for ath10k@lists.infradead.org; Fri, 17 Jan 2014 21:01:18 +0000
Received: by mail-ig0-f178.google.com with SMTP id uq10so2658093igb.5
 for <ath10k@lists.infradead.org>; Fri, 17 Jan 2014 13:00:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <cover.1389904166.git.agordeev@redhat.com>
References: <cover.1389904166.git.agordeev@redhat.com>
From: Bjorn Helgaas <bhelgaas@google.com>
Date: Fri, 17 Jan 2014 14:00:32 -0700
Message-ID: <CAErSpo5ztnyyceeN38XzLasLV6eJqdbqEV0viPp3Af8U=ts23w@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Phase out pci_enable_msi_block()
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
To: Alexander Gordeev <agordeev@redhat.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>, wil6210@qca.qualcomm.com, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Vladimir Kondratiev <qca_vkondrat@qca.qualcomm.com>, Alex Williamson <alex.williamson@redhat.com>, Brian King <brking@us.ibm.com>, linux-nvme@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, Tejun Heo <tj@kernel.org>, Matthew Wilcox <willy@linux.intel.com>

On Fri, Jan 17, 2014 at 9:02 AM, Alexander Gordeev <agordeev@redhat.com> wrote:
> This series is against "next" branch in Bjorn's repo:
> git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git
>
> Changes from v1 to v2:
>   - added a regression fix "ahci: Fix broken fallback to single
>     MSI mode" as patch 1/9;
>   - the series is reordered to move the regression fix in front;
>   - at Bjorn's request pci_enable_msi() is un-deprecated;
>   - as result, pci_enable_msi_range(pdev, 1, 1) styled calls
>     rolled back to pci_enable_msi(pdev);
>   - nvme bug fix moved out as a separate patch 5/9 "nvme: Fix
>     invalid call to irq_set_affinity_hint()"
>   - patches changelog elaborated a bit;
>
> Bjorn,
>
> As the release is supposedly this weekend, do you prefer
> the patches to go to your tree or to individual trees after
> the release?

I'd be happy to merge them, except for the fact that they probably
wouldn't have any time in -next before I ask Linus to pull them.  So
how about if we wait until after the release, ask the area maintainers
to take them, and if they don't take them, I'll put them in my tree
for v3.15?

Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
