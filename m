Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgI0V-000694-Cf
 for ath10k@lists.infradead.org; Tue, 12 Nov 2013 17:44:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Add logging to better determine some VIF/STA
 creation failures.
References: <1383585574-17779-1-git-send-email-greearb@candelatech.com>
Date: Tue, 12 Nov 2013 19:43:40 +0200
In-Reply-To: <1383585574-17779-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Mon, 4 Nov 2013 09:19:34
 -0800")
Message-ID: <87bo1pa52r.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: ath10k@lists.infradead.org

Thanks, applied with these changes:

commit 479398b07048342c7fdca89fd3a6cdb739e48a86
Author: Ben Greear <greearb@candelatech.com>
Date:   Mon Nov 4 09:19:34 2013 -0800

    ath10k: add logging to better determine some VIF/STA creation failures
    
    Not all errors were properly notified, fix that.
    
    kvalo: use ath10k_warn() for all messages, cosmetic changes to some of the messages
    
    Signed-off-by: Ben Greear <greearb@candelatech.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
