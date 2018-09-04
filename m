Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxIWm-0006Tx-1x
 for ath10k@lists.infradead.org; Tue, 04 Sep 2018 21:06:25 +0000
Date: Wed, 5 Sep 2018 05:05:54 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:pending 23/35] drivers/net/wireless/ath/ath10k/hw.c:1029:16:
 sparse: restricted __le32 degrades to integer
Message-ID: <201809050552.HsZAUOW5%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
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
To: Carl Huang <cjhuang@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   e7a96db0fc087f728af01fc0dea2ae4e90055d09
commit: 99df4b90a16df886e27c21a921f9be8abeec8b12 [23/35] ath10k: download firmware via diag Copy Engine for QCA6174 and QCA9377.
reproduce:
        # apt-get install sparse
        git checkout 99df4b90a16df886e27c21a921f9be8abeec8b12
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

   drivers/net/wireless/ath/ath10k/hw.c:679:20: sparse: expression using sizeof(void)
   drivers/net/wireless/ath/ath10k/hw.c:686:23: sparse: expression using sizeof(void)
   drivers/net/wireless/ath/ath10k/hw.c:692:23: sparse: expression using sizeof(void)
>> drivers/net/wireless/ath/ath10k/hw.c:1029:16: sparse: restricted __le32 degrades to integer
>> drivers/net/wireless/ath/ath10k/hw.c:1047:27: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] base_addr @@    got ed int [unsigned] [usertype] base_addr @@
   drivers/net/wireless/ath/ath10k/hw.c:1047:27:    expected unsigned int [unsigned] [usertype] base_addr
   drivers/net/wireless/ath/ath10k/hw.c:1047:27:    got restricted __le32 [usertype] addr
>> drivers/net/wireless/ath/ath10k/hw.c:1048:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] base_len @@    got ed int [unsigned] [usertype] base_len @@
   drivers/net/wireless/ath/ath10k/hw.c:1048:26:    expected unsigned int [unsigned] [usertype] base_len
   drivers/net/wireless/ath/ath10k/hw.c:1048:26:    got restricted __le32 [usertype] length

vim +1029 drivers/net/wireless/ath/ath10k/hw.c

  1007	
  1008	int ath10k_hw_diag_fast_download(struct ath10k *ar,
  1009					 u32 address,
  1010					 const void *buffer,
  1011					 u32 length)
  1012	{
  1013		const u8 *buf = buffer;
  1014		bool sgmt_end = false;
  1015		u32 base_addr = 0;
  1016		u32 base_len = 0;
  1017		u32 left = 0;
  1018		struct bmi_segmented_file_header *hdr;
  1019		struct bmi_segmented_metadata *metadata;
  1020		int ret = 0;
  1021	
  1022		if (length < sizeof(*hdr))
  1023			return -EINVAL;
  1024	
  1025		/* check firmware header. If it has no correct magic number
  1026		 * or it's compressed, returns error.
  1027		 */
  1028		hdr = (struct bmi_segmented_file_header *)buf;
> 1029		if (hdr->magic_num != BMI_SGMTFILE_MAGIC_NUM) {
  1030			ath10k_dbg(ar, ATH10K_DBG_BOOT,
  1031				   "Not a supported firmware, magic_num:0x%x\n",
  1032				   hdr->magic_num);
  1033			return -EINVAL;
  1034		}
  1035	
  1036		if (hdr->file_flags != 0) {
  1037			ath10k_dbg(ar, ATH10K_DBG_BOOT,
  1038				   "Not a supported firmware, file_flags:0x%x\n",
  1039				   hdr->file_flags);
  1040			return -EINVAL;
  1041		}
  1042	
  1043		metadata = (struct bmi_segmented_metadata *)hdr->data;
  1044		left = length - sizeof(*hdr);
  1045	
  1046		while (left > 0) {
> 1047			base_addr = metadata->addr;
> 1048			base_len = metadata->length;
  1049			buf = metadata->data;
  1050			left -= sizeof(*metadata);
  1051	
  1052			switch (base_len) {
  1053			case BMI_SGMTFILE_BEGINADDR:
  1054				/* base_addr is the start address to run */
  1055				ret = ath10k_bmi_set_start(ar, base_addr);
  1056				base_len = 0;
  1057				break;
  1058			case BMI_SGMTFILE_DONE:
  1059				/* no more segment */
  1060				base_len = 0;
  1061				sgmt_end = true;
  1062				ret = 0;
  1063				break;
  1064			case BMI_SGMTFILE_BDDATA:
  1065			case BMI_SGMTFILE_EXEC:
  1066				ath10k_warn(ar,
  1067					    "firmware has unsupported segment:%d\n",
  1068					    base_len);
  1069				ret = -EINVAL;
  1070				break;
  1071			default:
  1072				if (base_len > left) {
  1073					/* sanity check */
  1074					ath10k_warn(ar,
  1075						    "firmware has invalid segment length, %d > %d\n",
  1076						    base_len, left);
  1077					ret = -EINVAL;
  1078					break;
  1079				}
  1080	
  1081				ret = ath10k_hw_diag_segment_download(ar,
  1082								      buf,
  1083								      base_addr,
  1084								      base_len);
  1085	
  1086				if (ret)
  1087					ath10k_warn(ar,
  1088						    "failed to download firmware via diag interface:%d\n",
  1089						    ret);
  1090				break;
  1091			}
  1092	
  1093			if (ret || sgmt_end)
  1094				break;
  1095	
  1096			metadata = (struct bmi_segmented_metadata *)(buf + base_len);
  1097			left -= base_len;
  1098		}
  1099	
  1100		if (ret == 0)
  1101			ath10k_dbg(ar, ATH10K_DBG_BOOT,
  1102				   "boot firmware fast diag download successfully.\n");
  1103		return ret;
  1104	}
  1105	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
