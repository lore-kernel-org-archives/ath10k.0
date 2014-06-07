Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wt9JM-0003Fu-EL
 for ath10k@lists.infradead.org; Sat, 07 Jun 2014 05:37:00 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: compat-wireless-2014-05-22 breaks ath10k in an Archer C7 v2
References: <8738fimmjp.fsf@kamboji.qca.qualcomm.com>
 <53924F5F.5090104@gmail.com>
Date: Sat, 7 Jun 2014 08:36:31 +0300
In-Reply-To: <53924F5F.5090104@gmail.com> (Kamal Koshy's message of "Fri, 06
 Jun 2014 16:31:43 -0700")
Message-ID: <87wqctjn6o.fsf@kamboji.qca.qualcomm.com>
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
To: Kamal Koshy <kamal.koshy@gmail.com>
Cc: ath10k@lists.infradead.org

Kamal Koshy <kamal.koshy@gmail.com> writes:

> Attaching the result of dd if=/dev/mtd4 > ~/mtd4

Thanks, I'll take a look at that later. But before that, do you know
what's the mac address of the QCA9880 device with the proprietary
driver? (_not_ with ath10k) That would help searching for the
calibration data.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
