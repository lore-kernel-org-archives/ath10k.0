Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XLpYX-0000Db-8x
 for ath10k@lists.infradead.org; Mon, 25 Aug 2014 08:23:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix wmi service bitmap
References: <1408447352-28688-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 25 Aug 2014 11:22:38 +0300
In-Reply-To: <1408447352-28688-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 19 Aug 2014 13:22:32 +0200")
Message-ID: <87bnr96ks1.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Service mapping for main firmware branch was
> incorrectly used for 10.x firmware and vice-versa.
> This caused wmi_services in debugfs to print wrong
> values.
>
> This actually fixes a problem with the previous
> wmi service bitmap patch itself. For some reason
> there was either a conflict that wasn't resolved
> properly or git had a bad day.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied. I just changed the commit log a bit:

    ath10k: fix a conflict bug in wmi service bitmap
    
    Service mapping for main firmware branch was incorrectly used for 10.x firmware
    and vice-versa.  This caused wmi_services in debugfs to print wrong values.
    
    This fixes commit cff990ce7ddd6 ("ath10k: fix wmi service bitmap debug") where
    for some reason there was either a conflict that wasn't resolved properly or
    git had a bad day.
    
    Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
