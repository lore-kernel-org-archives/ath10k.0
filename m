Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aY9p2-0003ls-V2
 for ath10k@lists.infradead.org; Tue, 23 Feb 2016 10:04:03 +0000
From: "Kolli, Anilkumar" <akolli@qti.qualcomm.com>
Subject: RE: [PATCH] ath10k: Reduce number of peers to support peer stats
 feature
Date: Tue, 23 Feb 2016 10:03:32 +0000
Message-ID: <2f5a14dd58c0415d9e05bcfc8906ca58@aphydexm01a.ap.qualcomm.com>
References: <1456210197-27892-1-git-send-email-akolli@qti.qualcomm.com>
 <201602231517.vRn3Bvit%fengguang.wu@intel.com>
In-Reply-To: <201602231517.vRn3Bvit%fengguang.wu@intel.com>
Content-Language: en-US
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>, kbuild test robot <lkp@intel.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kbuild-all@01.org" <kbuild-all@01.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Kalle,

This patch depends on 'ath10k: add support for parsing per STA rx_duration for 10.2.4',
Which is part of ath.git pending branch.

Thanks,
Anil.


-----Original Message-----
From: kbuild test robot [mailto:lkp@intel.com] 
Sent: Tuesday, February 23, 2016 12:40 PM
To: Kolli, Anilkumar
Cc: kbuild-all@01.org; ath10k@lists.infradead.org; linux-wireless@vger.kernel.org; Kolli, Anilkumar
Subject: Re: [PATCH] ath10k: Reduce number of peers to support peer stats feature

Hi Anilkumar,

[auto build test ERROR on wireless-drivers-next/master] [also build test ERROR on v4.5-rc5 next-20160223] [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/akolli-qti-qualcomm-com/ath10k-Reduce-number-of-peers-to-support-peer-stats-feature/20160223-145312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next.git master
config: xtensa-allyesconfig (attached as .config)
reproduce:
        wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=xtensa 

All errors (new ones prefixed by >>):

   drivers/net/wireless/ath/ath10k/core.c: In function 'ath10k_core_init_firmware_features':
>> drivers/net/wireless/ath/ath10k/core.c:1481:16: error: 
>> 'WMI_SERVICE_PEER_STATS' undeclared (first use in this function)
      if (test_bit(WMI_SERVICE_PEER_STATS, ar->wmi.svc_map)) {
                   ^
   drivers/net/wireless/ath/ath10k/core.c:1481:16: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/net/wireless/ath/ath10k/wmi.c: In function 'ath10k_wmi_10_2_op_gen_init':
>> drivers/net/wireless/ath/ath10k/wmi.c:5464:15: error: 
>> 'WMI_SERVICE_PEER_STATS' undeclared (first use in this function)
     if (test_bit(WMI_SERVICE_PEER_STATS, ar->wmi.svc_map)) {
                  ^
   drivers/net/wireless/ath/ath10k/wmi.c:5464:15: note: each undeclared identifier is reported only once for each function it appears in

vim +/WMI_SERVICE_PEER_STATS +1481 drivers/net/wireless/ath/ath10k/core.c

  1475				WMI_STAT_PEER;
  1476			ar->max_spatial_stream = WMI_MAX_SPATIAL_STREAM;
  1477			break;
  1478		case ATH10K_FW_WMI_OP_VERSION_10_1:
  1479		case ATH10K_FW_WMI_OP_VERSION_10_2:
  1480		case ATH10K_FW_WMI_OP_VERSION_10_2_4:
> 1481			if (test_bit(WMI_SERVICE_PEER_STATS, ar->wmi.svc_map)) {
  1482				ar->max_num_peers = TARGET_10X_TX_STATS_NUM_PEERS;
  1483				ar->max_num_stations = TARGET_10X_TX_STATS_NUM_STATIONS;
  1484			} else {

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
