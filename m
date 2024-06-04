Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24150C27C54
	for <ath10k@archiver.kernel.org>; Tue,  4 Jun 2024 22:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=inQPca2qexc3f1YzzH7unkrDeiGUyf5eWJd5wIzungs=; b=EqemSOCxQDHNEKdvu7wK0ZClKU
	HcpdupEel/3UaGoVABM5xZW/ZGjEGVdKkRiJcj/tI64cojPhRUdJMQow358vbGQN5uIlzICIr0A8W
	xp7aZSedFqYsNJfgrmchgzZo+JANMGr54kNo4Xo5Ikjttmfatlf5usg+oM54mIjpsHqyUD++Lmc9Q
	uwePX0e+G0S+a9m57wt2v1Ui/Y3gMkPsfwWbMefIKuL2ccuayUDAddlj7fqud/9ZnLPJJmXxqT2Kf
	nQJF3xVEl2+ZsDy1R3R7Ms0/2CiMy+Bq1gGs99sLF5wGJJLCniCjkVJhzQ2pHIjuZ9X/1yK89Hzgx
	ME7+3fpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEd4w-0000000470o-3KE3;
	Tue, 04 Jun 2024 22:56:30 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEd4t-0000000470O-2G7P
	for ath10k@lists.infradead.org;
	Tue, 04 Jun 2024 22:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717541788; x=1749077788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vDd4QAVGXylqcxBvFGG9NNS7qOB8GjGN+CmZ40vpbCw=;
  b=aYshPGd3qJfzaRbUIqIjFNeitShUxGNI/fNbMtrGA8erWGjyyvdEdZ3e
   N+g413s4P2U0Vfx/C6bBF/g2g1oeM8LCGwid3fPR5GYkL/PsJDc6IFlmL
   Kv7Db6kXVcKuUmhCRZ8jAoACM6MQy7ht6hWb02Il1NtgGaAU+tqxGytzO
   ju/iUASx0NBIPZzhnUVhATpS3ugGvCm5kmcLmOwVH924Vw7dyqprvSGUH
   5rG9IvJlDLb07BKiumoc+MueNZeX8/zpFpmltrHwSb2veWhGP9lly7/69
   zYlmLBlTH3pK6xl5HqVidjTHfb4etwRAnBUTyiIdEiD0UgUV/LE3sldTx
   Q==;
X-CSE-ConnectionGUID: 4SFF4ljZQOeYX6nfV0tdDw==
X-CSE-MsgGUID: uVkQ8cFzT+2Ox4FG4DJORw==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14254485"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="14254485"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 15:56:27 -0700
X-CSE-ConnectionGUID: O8uXuBBWTE2P5WMuSi5xxg==
X-CSE-MsgGUID: 3o6+RsenTEKPgWqP8sHMmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="60577778"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jun 2024 15:56:25 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEd4o-0000df-2D;
	Tue, 04 Jun 2024 22:56:22 +0000
Date: Wed, 5 Jun 2024 06:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kalle Valo <kvalo@codeaurora.org>,
	ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending 5/5]
 drivers/net/wireless/ath/ath11k/pci.c:708:15: error: implicit declaration of
 function 'vzalloc'; did you mean 'kzalloc'?
Message-ID: <202406050650.VgDMtMhL-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_155627_663428_6A05D185 
X-CRM114-Status: GOOD (  10.23  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
head:   6f446d0a1af020dd164a006adc327f4fd3d5dacd
commit: 6f446d0a1af020dd164a006adc327f4fd3d5dacd [5/5] Merge branch 'pending' into master-pending
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240605/202406050650.VgDMtMhL-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406050650.VgDMtMhL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406050650.VgDMtMhL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath11k/pci.c: In function 'ath11k_pci_coredump_download':
>> drivers/net/wireless/ath/ath11k/pci.c:708:15: error: implicit declaration of function 'vzalloc'; did you mean 'kzalloc'? [-Werror=implicit-function-declaration]
     708 |         buf = vzalloc(len);
         |               ^~~~~~~
         |               kzalloc
>> drivers/net/wireless/ath/ath11k/pci.c:708:13: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     708 |         buf = vzalloc(len);
         |             ^
   cc1: some warnings being treated as errors


vim +708 drivers/net/wireless/ath/ath11k/pci.c

9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  681  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  682  static void ath11k_pci_coredump_download(struct ath11k_base *ab)
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  683  {
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  684  	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  685  	struct mhi_controller *mhi_ctrl = ab_pci->mhi_ctrl;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  686  	struct image_info *rddm_img, *fw_img;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  687  	struct timespec64 timestamp;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  688  	int i, len, mem_idx;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  689  	enum ath11k_fw_crash_dump_type mem_type;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  690  	struct ath11k_dump_file_data *file_data;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  691  	struct ath11k_tlv_dump_data *dump_tlv;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  692  	size_t hdr_len = sizeof(*file_data);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  693  	void *buf;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  694  	u32 dump_seg_sz[FW_CRASH_DUMP_TYPE_MAX] = { 0 };
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  695  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  696  	ath11k_mhi_coredump(mhi_ctrl, false);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  697  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  698  	len = ath11k_pci_coredump_calculate_size(ab, dump_seg_sz);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  699  	if (!len) {
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  700  		ath11k_warn(ab, "No crash dump data found for devcoredump");
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  701  		return;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  702  	}
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  703  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  704  	rddm_img = mhi_ctrl->rddm_image;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  705  	fw_img = mhi_ctrl->fbc_image;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  706  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  707  	/* dev_coredumpv() requires vmalloc data */
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31 @708  	buf = vzalloc(len);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  709  	if (!buf)
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  710  		return;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  711  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  712  	ab->dump_data = buf;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  713  	ab->ath11k_coredump_len = len;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  714  	file_data = ab->dump_data;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  715  	strscpy(file_data->df_magic, "ATH11K-FW-DUMP", sizeof(file_data->df_magic));
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  716  	file_data->len = cpu_to_le32(len);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  717  	file_data->version = cpu_to_le32(ATH11K_FW_CRASH_DUMP_V2);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  718  	file_data->chip_id = cpu_to_le32(ab_pci->dev_id);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  719  	file_data->qrtr_id = cpu_to_le32(ab_pci->ab->qmi.service_ins_id);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  720  	file_data->bus_id = cpu_to_le32(pci_domain_nr(ab_pci->pdev->bus));
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  721  	guid_gen(&file_data->guid);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  722  	ktime_get_real_ts64(&timestamp);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  723  	file_data->tv_sec = cpu_to_le64(timestamp.tv_sec);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  724  	file_data->tv_nsec = cpu_to_le64(timestamp.tv_nsec);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  725  	buf += hdr_len;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  726  	dump_tlv = buf;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  727  	dump_tlv->type = cpu_to_le32(FW_CRASH_DUMP_PAGING_DATA);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  728  	dump_tlv->tlv_len = cpu_to_le32(dump_seg_sz[FW_CRASH_DUMP_PAGING_DATA]);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  729  	buf += COREDUMP_TLV_HDR_SIZE;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  730  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  731  	/* append all segments together as they are all part of a single contiguous
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  732  	 * block of memory
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  733  	 */
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  734  	for (i = 0; i < fw_img->entries ; i++) {
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  735  		if (!fw_img->mhi_buf[i].buf)
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  736  			continue;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  737  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  738  		memcpy_fromio(buf, (void const __iomem *)fw_img->mhi_buf[i].buf,
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  739  			      fw_img->mhi_buf[i].len);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  740  		buf += fw_img->mhi_buf[i].len;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  741  	}
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  742  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  743  	dump_tlv = buf;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  744  	dump_tlv->type = cpu_to_le32(FW_CRASH_DUMP_RDDM_DATA);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  745  	dump_tlv->tlv_len = cpu_to_le32(dump_seg_sz[FW_CRASH_DUMP_RDDM_DATA]);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  746  	buf += COREDUMP_TLV_HDR_SIZE;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  747  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  748  	/* append all segments together as they are all part of a single contiguous
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  749  	 * block of memory
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  750  	 */
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  751  	for (i = 0; i < rddm_img->entries; i++) {
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  752  		if (!rddm_img->mhi_buf[i].buf)
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  753  			continue;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  754  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  755  		memcpy_fromio(buf, (void const __iomem *)rddm_img->mhi_buf[i].buf,
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  756  			      rddm_img->mhi_buf[i].len);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  757  		buf += rddm_img->mhi_buf[i].len;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  758  	}
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  759  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  760  	mem_idx = FW_CRASH_DUMP_REMOTE_MEM_DATA;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  761  	for (; mem_idx < FW_CRASH_DUMP_TYPE_MAX; mem_idx++) {
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  762  		if (mem_idx == FW_CRASH_DUMP_NONE)
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  763  			continue;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  764  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  765  		dump_tlv = buf;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  766  		dump_tlv->type = cpu_to_le32(mem_idx);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  767  		dump_tlv->tlv_len = cpu_to_le32(dump_seg_sz[mem_idx]);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  768  		buf += COREDUMP_TLV_HDR_SIZE;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  769  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  770  		if (!dump_tlv->tlv_len)
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  771  			continue;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  772  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  773  		for (i = 0; i < ab->qmi.mem_seg_count; i++) {
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  774  			mem_type = ath11k_coredump_get_dump_type
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  775  						(ab->qmi.target_mem[i].type);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  776  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  777  			if (mem_type != mem_idx)
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  778  				continue;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  779  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  780  			if (!ab->qmi.target_mem[i].v.iaddr) {
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  781  				ath11k_dbg(ab, ATH11K_DBG_PCI,
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  782  					   "Skipping mem region type %d",
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  783  					   ab->qmi.target_mem[i].type);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  784  				continue;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  785  			}
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  786  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  787  			memcpy_fromio(buf, ab->qmi.target_mem[i].v.iaddr,
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  788  				      ab->qmi.target_mem[i].size);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  789  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  790  			buf += ab->qmi.target_mem[i].size;
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  791  		}
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  792  	}
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  793  
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  794  	queue_work(ab->workqueue, &ab->dump_work);
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  795  }
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  796  #endif
9e0e90f4ca68b5 Miaoqing Pan 2024-05-31  797  

:::::: The code at line 708 was first introduced by commit
:::::: 9e0e90f4ca68b50d1c7016d565731c0c2b31b2ef wifi: ath11k: Add firmware coredump collection support

:::::: TO: Miaoqing Pan <quic_miaoqing@quicinc.com>
:::::: CC: Kalle Valo <quic_kvalo@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

