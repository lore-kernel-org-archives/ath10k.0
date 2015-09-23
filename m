Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from p3plsmtpa06-01.prod.phx3.secureserver.net ([173.201.192.102])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZepCq-0001uR-Qc
 for ath10k@lists.infradead.org; Wed, 23 Sep 2015 18:55:53 +0000
From: "William Riba" <wriba@wriba.com>
Subject: QCA9880/9890 rfkill
Date: Wed, 23 Sep 2015 13:55:30 -0500
Message-ID: <019a01d0f631$6d01cf90$47056eb0$@wriba.com>
MIME-Version: 1.0
Content-Language: en-us
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

Does anybody know whether rfkill in its hard block flavor is supported in
any QCA9880/9890 based device and/or firmware load? While vendors refer to
the WiFi disable/GPIO line in their reference schematics, it is not
functional.  What I see after testing multiple cards is if the line is
asserted during operation, there seems to be no effect. If it is asserted at
boot-up, the device does not enumerate on the PCI bus. 

If Qualcomm does not intend to support this functionality anymore it would
be nice to know. Hard kills are a regulatory requirement for certain
applications. While we would like to use a QCA9890 in a new application,
there's no way it could make it through qualifications with its current
operation.  Any additional information on this would be welcome. Thanks.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
