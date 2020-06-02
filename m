Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfwWJ-0006px-Vd
 for ath10k@lists.infradead.org; Tue, 02 Jun 2020 02:19:19 +0000
Date: Tue, 02 Jun 2020 10:18:28 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:ath11k-qca6390-bringup] BUILD SUCCESS
 d63a45325ba8378b7fd477083fcadc41ca7c1bc8
Message-ID: <5ed5b6f4.CGqEtBOKXl9kToyp%lkp@intel.com>
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
branch HEAD: d63a45325ba8378b7fd477083fcadc41ca7c1bc8  HACK: ath11k: add more debug message for kvalo

Warning in current branch:

drivers/net/wireless/ath/ath11k/dp.c:124:5: warning: no previous prototype for 'ath11k_dp_srng_calculate_msi_group' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/hw.c:208:5: warning: no previous prototype for 'ath11k_mac_id_to_pdev_id_ipq8074' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/hw.c:213:5: warning: no previous prototype for 'ath11k_mac_id_to_srng_id_ipq8074' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/hw.c:218:5: warning: no previous prototype for 'ath11k_mac_id_to_pdev_id_qca6x90' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/hw.c:223:5: warning: no previous prototype for 'ath11k_mac_id_to_srng_id_qca6x90' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/mhi.c:321:5: warning: no previous prototype for 'ath11k_pci_set_mhi_state' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:1174:5: warning: no previous prototype for 'ath11k_pci_init' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:1187:6: warning: no previous prototype for 'ath11k_pci_exit' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:371:6: warning: no previous prototype for 'ath11k_pci_get_msi_address' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:417:5: warning: no previous prototype for 'ath11k_get_user_msi_assignment' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:759:5: warning: no previous prototype for 'ath11k_pci_qca6x90_powerup' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:764:6: warning: no previous prototype for 'ath11k_pci_qca6x90_powerdown' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/qmi.c:1676:8: warning: format '%d' expects a matching 'int' argument [-Wformat=]
drivers/net/wireless/ath/ath11k/qmi.c:1676:8: warning: format '%d' expects argument of type 'int', but argument 4 has type 'dma_addr_t' {aka 'long long unsigned int'} [-Wformat=]

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
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
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|   |-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-dma_addr_t-aka-long-long-unsigned-int
|-- arc-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-dma_addr_t-aka-long-long-unsigned-int
|-- arm-allmodconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|-- arm-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|-- arm64-allmodconfig
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
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|   |-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-dma_addr_t-aka-long-long-unsigned-int
|-- arm64-allyesconfig
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
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|   |-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-dma_addr_t-aka-long-long-unsigned-int
|-- c6x-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-dp.c:warning:no-previous-prototype-for-ath11k_dp_srng_calculate_msi_group
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_qca6x90
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_qca6x90
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|-- h8300-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-dp.c:warning:no-previous-prototype-for-ath11k_dp_srng_calculate_msi_group
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_qca6x90
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_ipq8074
|   `-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_qca6x90
|-- h8300-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-dp.c:warning:no-previous-prototype-for-ath11k_dp_srng_calculate_msi_group
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_qca6x90
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_ipq8074
|   `-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_qca6x90
|-- i386-allyesconfig
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
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|-- ia64-allmodconfig
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
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|   |-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-dma_addr_t-aka-long-long-unsigned-int
|-- ia64-allyesconfig
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
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|   |-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-dma_addr_t-aka-long-long-unsigned-int
|-- m68k-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-dp.c:warning:no-previous-prototype-for-ath11k_dp_srng_calculate_msi_group
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_qca6x90
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_qca6x90
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|-- m68k-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-dp.c:warning:no-previous-prototype-for-ath11k_dp_srng_calculate_msi_group
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_qca6x90
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_qca6x90
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|-- mips-allmodconfig
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
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|-- mips-allyesconfig
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
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|-- nios2-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-dp.c:warning:no-previous-prototype-for-ath11k_dp_srng_calculate_msi_group
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_qca6x90
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_qca6x90
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|-- openrisc-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-dp.c:warning:no-previous-prototype-for-ath11k_dp_srng_calculate_msi_group
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_qca6x90
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_qca6x90
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|-- parisc-allmodconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|-- parisc-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|-- powerpc-allmodconfig
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
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|   |-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-dma_addr_t-aka-long-long-unsigned-int
|-- powerpc-allyesconfig
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
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|   |-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-dma_addr_t-aka-long-long-unsigned-int
|-- riscv-allmodconfig
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
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|   |-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-dma_addr_t-aka-long-long-unsigned-int
|-- riscv-allyesconfig
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
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|   |-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-dma_addr_t-aka-long-long-unsigned-int
|-- sh-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-dp.c:warning:no-previous-prototype-for-ath11k_dp_srng_calculate_msi_group
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_qca6x90
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_ipq8074
|   |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_qca6x90
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|-- sparc-allyesconfig
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
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|   |-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-dma_addr_t-aka-long-long-unsigned-int
|-- sparc64-allmodconfig
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
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|   |-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-dma_addr_t-aka-long-long-unsigned-int
|-- sparc64-allyesconfig
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
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup
|   |-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-a-matching-int-argument
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-d-expects-argument-of-type-int-but-argument-has-type-dma_addr_t-aka-long-long-unsigned-int
`-- xtensa-allyesconfig
    |-- drivers-net-wireless-ath-ath11k-dp.c:warning:no-previous-prototype-for-ath11k_dp_srng_calculate_msi_group
    |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_ipq8074
    |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_pdev_id_qca6x90
    |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_ipq8074
    |-- drivers-net-wireless-ath-ath11k-hw.c:warning:no-previous-prototype-for-ath11k_mac_id_to_srng_id_qca6x90
    |-- drivers-net-wireless-ath-ath11k-mhi.c:warning:no-previous-prototype-for-ath11k_pci_set_mhi_state
    |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_get_user_msi_assignment
    |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_exit
    |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_get_msi_address
    |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_init
    |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerdown
    `-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_qca6x90_powerup

elapsed time: 483m

configs tested: 84
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
nds32                            alldefconfig
mips                         tb0287_defconfig
sh                         microdev_defconfig
powerpc                       holly_defconfig
powerpc                mpc7448_hpc2_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
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
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
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
