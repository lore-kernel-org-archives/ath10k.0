Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from edge10.ethz.ch ([82.130.75.186])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ypggr-0006H0-1z
 for ath10k@lists.infradead.org; Tue, 05 May 2015 17:31:29 +0000
From: "Costa Molero  Edgar" <cedgar@student.ethz.ch>
Subject: Getting RSSI per antenna.
Date: Tue, 5 May 2015 17:30:57 +0000
Message-ID: <BB63CF2605733841BD56CD9C38AC1F7E1F34E56E@MBX13.d.ethz.ch>
Content-Language: ca-ES
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi guys,

Is there anyway I can get a separate RSSI for each one of the antennas ? I guess that the signal level reported by iwconfig is a combination, so it should be a way to get them separately. Is that functionality implemented or if not could some one tell me which variables from the driver contain that information ?

Thank you very much,

Rfhst
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
