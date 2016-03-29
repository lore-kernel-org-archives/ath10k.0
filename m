Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akphb-0000tI-Sw
 for ath10k@lists.infradead.org; Tue, 29 Mar 2016 09:12:51 +0000
References: <1458647539-17213-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1458647539-17213-2-git-send-email-rmanohar@qti.qualcomm.com>
 <8760wcdnws.fsf@kamboji.qca.qualcomm.com>
 <1458834773112.89396@qti.qualcomm.com>
 <87bn5xd96c.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <276aecc9-73a9-d71e-5aac-69c4eacf38d8@dd-wrt.com>
Date: Tue, 29 Mar 2016 11:12:52 +0200
MIME-Version: 1.0
In-Reply-To: <87bn5xd96c.fsf@kamboji.qca.qualcomm.com>
Subject: latest ath10k pending tree bug's
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

the new introduced code which initialized the precal data for new 
chipsets will break QCA99XX support.
so ath10k fails to initialize.
i commented out
ret = ath10k_core_pre_cal_config(ar);
and
  ret = ath10k_core_pre_cal_download(ar);

to get it working again. this might not affect real pcie cards. but on 
IPQ8064 based boards with on board wifi cards it shows that behaviour.


in addition this message here floods the kernel log
[125917.204121] ath10k_pci 0001:01:00.0: failed to increase tx mgmt 
pending count: -16, dropping
but it has no further visible side effects


Sebastian



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
