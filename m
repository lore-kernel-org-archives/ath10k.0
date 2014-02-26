Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIhfO-0006i8-BD
 for ath10k@lists.infradead.org; Wed, 26 Feb 2014 16:49:07 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k:  make TARGET_NUM_PEERS match WMI_MAX_KEY_INDEX.
References: <1392742567-6134-1-git-send-email-greearb@candelatech.com>
Date: Wed, 26 Feb 2014 18:48:40 +0200
In-Reply-To: <1392742567-6134-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Tue, 18 Feb 2014 08:56:07
 -0800")
Message-ID: <87r46plt07.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> This appears to fix the problem of running out of keys
> in the firmware.  Possibly it only hides the problem,
> however.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

IIRC you asked me to drop this patch in other thread. I have now done
that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
