Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [196.1.105.47] (helo=sandesh.cdotd.ernet.in)
 by merlin.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eqcWU-00062L-LH
 for ath10k@lists.infradead.org; Tue, 27 Feb 2018 10:30:22 +0000
From: "KAVITA MATHUR" <kavitam@cdot.in>
Subject: fixed bit rate 9Mbps set as 24Mbps in g mode(legacy)
Date: Tue, 27 Feb 2018 14:19:49 +0530
Message-Id: <20180227083933.M59708@cdot.in>
In-Reply-To: <1519625792-12010-1-git-send-email-periyasa@codeaurora.org>
References: <1519625792-12010-1-git-send-email-periyasa@codeaurora.org>
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
To: ath10k@lists.infradead.org, backports@vger.kernel.org
Cc: linux-wireless@vger.kernel.org

Hi,

I have configured AP in g mode and tested legacy rates.All basic rates and supported
rates(1,2,5.5,11,6,9,12,18,24,36,48,54) are set except 9Mbps.

When fixed bit rate 9Mbps is set, it gets set as 24 Mbps. This issue has been observed
in backports-4.4.2-1 as well as latest git version of ath10k driver.


Is anybody aware of this issue? How can I fix this rate 9Mbps?


Thanks & Regards,
Kavita



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
