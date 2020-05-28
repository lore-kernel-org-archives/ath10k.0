Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeCZ7-00010j-2m
 for ath10k@lists.infradead.org; Thu, 28 May 2020 07:03:01 +0000
Date: Thu, 28 May 2020 15:02:46 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:ath11k-qca6390-bringup] BUILD REGRESSION
 7f2aca90d49b9d6d85a7d712421e1d02ce4bba2f
Message-ID: <5ecf6216.hgFA+B4pSgyY7jpf%lkp@intel.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  ath11k-qca6390-bringup
branch HEAD: 7f2aca90d49b9d6d85a7d712421e1d02ce4bba2f  HACK: ath11k: mhi: enable MHI_ER_CTRL

Error/Warning in current branch:

drivers/net/wireless/ath/ath11k/debug.c:710:45: error: '(struct dp_rxdma_ring *)&ar->dp.rx_mon_status_refill_ring' is a pointer; did you mean to use '->'?
drivers/net/wireless/ath/ath11k/dp.c:124:5: warning: no previous prototype for 'ath11k_dp_srng_calculate_msi_group' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/hw.c:208:5: warning: no previous prototype for 'ath11k_mac_id_to_pdev_id_ipq8074' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/hw.c:213:5: warning: no previous prototype for 'ath11k_mac_id_to_srng_id_ipq8074' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/hw.c:218:5: warning: no previous prototype for 'ath11k_mac_id_to_pdev_id_qca6x90' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/hw.c:223:5: warning: no previous prototype for 'ath11k_mac_id_to_srng_id_qca6x90' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/mhi.c:296:5: warning: no previous prototype for 'ath11k_pci_set_mhi_state' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/mhi.c:321:5: warning: no previous prototype for 'ath11k_pci_set_mhi_state' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:1174:5: warning: no previous prototype for 'ath11k_pci_init' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:1187:6: warning: no previous prototype for 'ath11k_pci_exit' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:275:6: warning: no previous prototype for 'ath11k_pci_get_msi_address' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:321:5: warning: no previous prototype for 'ath11k_get_user_msi_assignment' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:371:6: warning: no previous prototype for 'ath11k_pci_get_msi_address' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:417:5: warning: no previous prototype for 'ath11k_get_user_msi_assignment' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:69:5: warning: no previous prototype for 'ath11k_pci_init' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:759:5: warning: no previous prototype for 'ath11k_pci_qca6x90_powerup' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:764:6: warning: no previous prototype for 'ath11k_pci_qca6x90_powerdown' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:81:5: warning: no previous prototype for 'ath11k_pci_qca6x90_powerup' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:82:6: warning: no previous prototype for 'ath11k_pci_exit' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:86:6: warning: no previous prototype for 'ath11k_pci_qca6x90_powerdown' [-Wmissing-prototypes]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-debug.c:error:(struct-dp_rxdma_ring-)-ar-dp.rx_mon_status_refill_ring-is-a-pointer
|   |-- drivers-net-wireless-ath-ath11k-dp.c:warning:no-previous-prototype-for-ath11k_dp_srng_calculate_msi_group
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_qca6x90
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_qca6x90
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_get_user_msi_assignment
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_get_msi_address
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|-- arc-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-debug.c:error:(struct-dp_rxdma_ring-)-ar-dp.rx_mon_status_refill_ring-is-a-pointer
|   |-- drivers-net-wireless-ath-ath11k-dp.c:warning:no-previous-prototype-for-ath11k_dp_srng_calculate_msi_group
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_qca6x90
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_qca6x90
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_get_user_msi_assignment
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_get_msi_address
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|-- arm-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-dp.c:warning:no-previous-prototype-for-ath11k_dp_srng_calculate_msi_group
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_get_user_msi_assignment
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_get_msi_address
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|-- arm-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-dp.c:warning:no-previous-prototype-for-ath11k_dp_srng_calculate_msi_group
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_get_user_msi_assignment
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_get_msi_address
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|-- arm64-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|-- arm64-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|-- i386-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|-- i386-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|-- ia64-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-debug.c:error:(struct-dp_rxdma_ring-)-ar-dp.rx_mon_status_refill_ring-is-a-pointer
|   |-- drivers-net-wireless-ath-ath11k-dp.c:warning:no-previous-prototype-for-ath11k_dp_srng_calculate_msi_group
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_qca6x90
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_qca6x90
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_get_user_msi_assignment
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_get_msi_address
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|-- ia64-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|-- m68k-randconfig-s032-20200528
|   |-- drivers-net-wireless-ath-ath11k-dp.c:warning:no-previous-prototype-for-ath11k_dp_srng_calculate_msi_group
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_qca6x90
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_ipq8074
|   `-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_qca6x90
|-- mips-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|-- mips-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|-- nios2-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-debug.c:error:(struct-dp_rxdma_ring-)-ar-dp.rx_mon_status_refill_ring-is-a-pointer
|   |-- drivers-net-wireless-ath-ath11k-dp.c:warning:no-previous-prototype-for-ath11k_dp_srng_calculate_msi_group
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_qca6x90
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_ipq8074
|   `-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_qca6x90
|-- parisc-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|-- parisc-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|-- powerpc-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_get_user_msi_assignment
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_get_msi_address
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|-- powerpc-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_get_user_msi_assignment
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_get_msi_address
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|-- riscv-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|-- riscv-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|-- sparc-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|-- sparc64-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|-- sparc64-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|-- x86_64-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
`-- xtensa-allyesconfig
    |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
    `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init

elapsed time: 814m

configs tested: 103
configs skipped: 1

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
arc                              allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200527
i386                 randconfig-a004-20200527
i386                 randconfig-a003-20200527
i386                 randconfig-a006-20200527
i386                 randconfig-a002-20200527
i386                 randconfig-a005-20200527
x86_64               randconfig-a013-20200528
x86_64               randconfig-a015-20200528
x86_64               randconfig-a012-20200528
x86_64               randconfig-a016-20200528
x86_64               randconfig-a014-20200528
x86_64               randconfig-a011-20200528
x86_64               randconfig-a006-20200527
x86_64               randconfig-a002-20200527
x86_64               randconfig-a005-20200527
x86_64               randconfig-a003-20200527
x86_64               randconfig-a004-20200527
x86_64               randconfig-a001-20200527
i386                 randconfig-a013-20200527
i386                 randconfig-a015-20200527
i386                 randconfig-a012-20200527
i386                 randconfig-a011-20200527
i386                 randconfig-a016-20200527
i386                 randconfig-a014-20200527
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
