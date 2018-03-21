Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x231.google.com ([2607:f8b0:4001:c0b::231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eygkp-00054u-1q
 for ath10k@lists.infradead.org; Wed, 21 Mar 2018 16:38:24 +0000
Received: by mail-it0-x231.google.com with SMTP id c1-v6so6591063itj.1
 for <ath10k@lists.infradead.org>; Wed, 21 Mar 2018 09:38:12 -0700 (PDT)
Received: from [28.126.21.33] (66-87-143-33.pools.spcsdns.net. [66.87.143.33])
 by smtp.gmail.com with ESMTPSA id
 v23sm3243754iov.57.2018.03.21.09.38.09
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Mar 2018 09:38:10 -0700 (PDT)
From: paresh chaudhary <chaudharyparesh1986@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 21 Mar 2018 11:38:06 -0500
Subject: [ath10k] not working in 64 bit with >2GB Ram
Message-Id: <C8E19707-2E18-4EBE-A83F-8F9A5CC8C86E@gmail.com>
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
To: ath10k@lists.infradead.org

Hi Team,

We need your help regarding ath10k module.

We are using ath10k wifi module with T1040 processor. We have total 8GB DDR in a system. 

The ath10k is working fine on a 32bit system but it's not working on 64 bit system. We are getting error ( ath10k_pci 0001:01:00.0: failed to transmit packet : drivers/net/wireless/ath/ath10k/mac.c). 


NOTE: One interesting point is that when we set DDR size is equal to 2GB from uboot console rather than to use full 8GB  (setenv bootargs "root=/dev/ram rw console=ttyS0,115200 quiet mem=2050M") then ath10k is working fine on a 64bit machine. 


Is it related to DMA? Do you have a patch to resolve this?


We are using linux-fsl-sdk-v2.0 ( 4.1.35) from nxp.

Regards, 
Paresh
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
