Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alRd5-0005Sd-48
 for ath10k@lists.infradead.org; Thu, 31 Mar 2016 01:42:35 +0000
Received: by mail-oi0-x22b.google.com with SMTP id d205so40851425oia.0
 for <ath10k@lists.infradead.org>; Wed, 30 Mar 2016 18:42:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1459379297-21496-1-git-send-email-greearb@candelatech.com>
References: <1459379297-21496-1-git-send-email-greearb@candelatech.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Thu, 31 Mar 2016 12:41:54 +1100
Message-ID: <CAGRGNgWEua3EOePQFRS_AR5BnSUPUhFrudWs2hY7YPLizxnyhQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Fix deadlock when peer cannot be created.
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Hi Ben,

On Thu, Mar 31, 2016 at 10:08 AM,  <greearb@candelatech.com> wrote:
> From: Ben Greear <greearb@candelatech.com>
>
> We must not attempt to send WMI packets while dholding the data-lock,

s/dholding/holding/ ?

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
