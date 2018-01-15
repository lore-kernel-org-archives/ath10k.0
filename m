Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from aserp2130.oracle.com ([141.146.126.79])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eb1ct-0005Px-0C
 for ath10k@lists.infradead.org; Mon, 15 Jan 2018 10:04:28 +0000
Date: Mon, 15 Jan 2018 13:00:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] ath10k: add memory dump support for QCA6174/QCA9377
Message-ID: <20180115100043.poxnok4cduzz6mbj@mwanda>
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
To: alanliu@qca.qualcomm.com
Cc: ath10k@lists.infradead.org

Hello Alan Liu,

The patch 703f261dd77f: "ath10k: add memory dump support for
QCA6174/QCA9377" from Dec 22, 2017, leads to the following static
checker warning:

	drivers/net/wireless/ath/ath10k/pci.c:1481 ath10k_pci_dump_memory_section()
	warn: unsigned 'mem_region->section_table.size' is never less than zero.

drivers/net/wireless/ath/ath10k/pci.c
  1470  static int ath10k_pci_dump_memory_section(struct ath10k *ar,
  1471                                            const struct ath10k_mem_region *mem_region,
  1472                                            u8 *buf, size_t buf_len)
  1473  {
  1474          const struct ath10k_mem_section *cur_section, *next_section;
  1475          unsigned int count, section_size, skip_size;
  1476          int ret, i, j;
  1477  
  1478          if (!mem_region || !buf)
  1479                  return 0;
  1480  
  1481          if (mem_region->section_table.size < 0)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Impossible condition

  1482                  return 0;
  1483  
  1484          cur_section = &mem_region->section_table.sections[0];
  1485  
  1486          if (mem_region->start > cur_section->start) {
  1487                  ath10k_warn(ar, "incorrect memdump region 0x%x with section start addrress 0x%x.\n",
  1488                              mem_region->start, cur_section->start);
  1489                  return 0;
  1490          }

regards,
dan carpenter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
