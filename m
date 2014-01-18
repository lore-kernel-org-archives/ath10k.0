Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Sat, 18 Jan 2014 08:15:38 +0100
From: Alexander Gordeev <agordeev@redhat.com>
Subject: Re: [PATCH v2 0/9] Phase out pci_enable_msi_block()
Message-ID: <20140118071538.GA32535@dhcp-26-207.brq.redhat.com>
References: <cover.1389904166.git.agordeev@redhat.com>
 <CAErSpo5ztnyyceeN38XzLasLV6eJqdbqEV0viPp3Af8U=ts23w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAErSpo5ztnyyceeN38XzLasLV6eJqdbqEV0viPp3Af8U=ts23w@mail.gmail.com>
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
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>, wil6210@qca.qualcomm.com, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Vladimir Kondratiev <qca_vkondrat@qca.qualcomm.com>, Alex Williamson <alex.williamson@redhat.com>, Brian King <brking@us.ibm.com>, linux-nvme@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, Tejun Heo <tj@kernel.org>, Matthew Wilcox <willy@linux.intel.com>

On Fri, Jan 17, 2014 at 02:00:32PM -0700, Bjorn Helgaas wrote:
> > As the release is supposedly this weekend, do you prefer
> > the patches to go to your tree or to individual trees after
> > the release?
> 
> I'd be happy to merge them, except for the fact that they probably
> wouldn't have any time in -next before I ask Linus to pull them.  So
> how about if we wait until after the release, ask the area maintainers
> to take them, and if they don't take them, I'll put them in my tree
> for v3.15?

Patch 11 depends on patches 1-10, so I am not sure how to better handle it.
Whatever works for you ;)

I am only concerned with a regression fix "ahci: Fix broken fallback to
single MSI mode" which would be nice to have in 3.14. But it seems pretty
much too late.

> Bjorn

Thanks!

-- 
Regards,
Alexander Gordeev
agordeev@redhat.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
