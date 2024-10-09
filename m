Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A65CF0440
	for <ath10k@archiver.kernel.org>; Wed,  9 Oct 2024 04:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EqBlnL5XmEW9U6Jq3ntU1bblNFpt11E3e2qjYfLLMDU=; b=kvidYOXilad4u2VzEgHMurY0YU
	br5Cm3hUh8WRdDU49P0f+YjsNtMahS4Xsm1hv9Qm4Yyo2aHqYvAH9tERiSP72LZws2Hsyl3b8vQ2o
	7cM0n+4V71W/PZuQsOzdxOeOXAE97g4Z4TiDx/R0Q6gWJH4pW7bukYAJZ6EM35i5hBsvqCz5efssz
	uPER5HxhLSq/59FyIIUksXtDKgKAu7SIn+AHcw1WVhP+jhNVemodmoAdHjLvCzahoXAVNLic4RT+V
	ByUwthUvsjMDqgQuQx8vdDIZIqIHuBkywEcHirrzjyv5c6ONDjoOalDAaJNlkSOuptpSNAKwP1XJ0
	YddUlT2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syO7r-00000007qka-2kPY;
	Wed, 09 Oct 2024 04:16:39 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syO7o-00000007qjB-1HQ5;
	Wed, 09 Oct 2024 04:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728447396; x=1759983396;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M4d2jOZZqfKpzWFfGSamwuRPKlayPZoicYOtG1LSiR0=;
  b=iW9Mpz0xbKpUQHdFf/BunLB0Xd5eFlCCD1aDgC5V60XiPOoSumqOX1NC
   jdrz2vGO9/DU4GRxnRnj75Lyrvn4EcT/KKCvagUNjdgKRF7rbYmFDJ+ih
   OPihAJAvblOzF/yTzTtTkiCCoBzl9tb5qfn5gN4UstQybmGfLyL5mEOXo
   lP+d8Frau3dzWPSqEduMnfll73vD7rUJa16IZV0BBvfrwXHN/rjF6kXVd
   2sJTc3IFK/D5SaOkQLnToFBQKxV+KJKEO81sJgKfZzkcyLH5QIz0/ci11
   zY14K+SvCl26BZYm6u0tbOWUSWlivI+2udft8w/4UZSewE5dGgDsFgojw
   w==;
X-CSE-ConnectionGUID: b9kIotdtTnSuSR5y2YVWxA==
X-CSE-MsgGUID: tT8FLeX5RUisVQ+MeNmzTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="53126967"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="53126967"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 21:16:30 -0700
X-CSE-ConnectionGUID: O9Is6FHoS7CD+qGn6Zcb+Q==
X-CSE-MsgGUID: Nn4HZwF9Ryq5M7Emp5n9Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="80095674"
Received: from allen-box.sh.intel.com ([10.239.159.127])
  by fmviesa003.fm.intel.com with ESMTP; 08 Oct 2024 21:16:25 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Yi Liu <yi.l.liu@intel.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	mst@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	Lyude Paul <lyude@redhat.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH v4 0/4] iommu: Refactoring domain allocation interface
Date: Wed,  9 Oct 2024 12:11:43 +0800
Message-ID: <20241009041147.28391-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_211636_381118_D4D16300 
X-CRM114-Status: GOOD (  20.35  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

The IOMMU subsystem has undergone some changes, including the removal
of iommu_ops from the bus structure. Consequently, the existing domain
allocation interface, which relies on a bus type argument, is no longer
relevant:

    struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)

This series is designed to refactor the use of this interface. It
proposes a new interface iommu_paging_domain_alloc() to replace
iommu_domain_alloc(). This interface is for allocating iommu paging
domains for kernel drivers. It takes a device pointer as a parameter,
which better reflects the current design of the IOMMU subsystem.

The majority of device drivers currently using iommu_domain_alloc() do
so to allocate a domain for a specific device and then attach that
domain to the device. These cases can be straightforwardly migrated to
the new interface.

The drm/tegra driver is a bit different in that the device pointer
passed to the helper, which allocates the iommu domain, is not the one
that will be used for the kernel DMA API. Move the existing logic in
iommu_domain_alloc() into the driver to ensure it works as intended.

Now that all consumers of iommu_domain_alloc() have switched to the new
interface, we can finally remove iommu_domain_alloc(). This removal
paves the way for the IOMMU subsystem to support multiple iommu drivers.
Additionally, the individual iommu driver implementation for domain
allocation could also be simplified, as there will always be a valid
device pointer passed along the path.

Change log:

v4:
 - 4 patches remained in this series. These patches have been reviewed
   and ack'ed but missed the merge window of v6.12-rc1. I resent them in
   a series to make it go through the iommu tree.

v3: https://lore.kernel.org/linux-iommu/20240610085555.88197-1-baolu.lu@linux.intel.com/
 - Remove the proposed iommu_user_domain_alloc() interface.
 - Most of the patches have been merged through the subsystem trees.

v2: https://lore.kernel.org/linux-iommu/20240604015134.164206-1-baolu.lu@linux.intel.com/
 - Drop the vt-d patches which implement paging domain support from this
   series. I will post them in a separate series later.
 - Convert all drivers that call iommu_domain_alloc() to use the new
   interface and remove iommu_domain_alloc() from the tree.
 - For the drm/msm driver, make the code compatible with the no-IOMMU
   case.
 - Various cleanups and refinements.

v1: https://lore.kernel.org/linux-iommu/20240529053250.91284-1-baolu.lu@linux.intel.com/

Lu Baolu (4):
  remoteproc: Use iommu_paging_domain_alloc()
  media: nvidia: tegra: Use iommu_paging_domain_alloc()
  drm/nouveau/tegra: Use iommu_paging_domain_alloc()
  iommu: Remove iommu_domain_alloc()

 include/linux/iommu.h                         |  6 ----
 .../drm/nouveau/nvkm/engine/device/tegra.c    |  4 +--
 drivers/iommu/iommu.c                         | 36 -------------------
 .../media/platform/nvidia/tegra-vde/iommu.c   |  7 ++--
 drivers/remoteproc/remoteproc_core.c          |  6 ++--
 5 files changed, 9 insertions(+), 50 deletions(-)

-- 
2.43.0


