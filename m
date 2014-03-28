Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTYFt-0007zx-Dk
 for ath10k@lists.infradead.org; Fri, 28 Mar 2014 14:59:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k:  add the Rx rate in FW stats
References: <1395441560-6028-1-git-send-email-greearb@candelatech.com>
Date: Fri, 28 Mar 2014 16:59:10 +0200
In-Reply-To: <1395441560-6028-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Fri, 21 Mar 2014 15:39:20
 -0700")
Message-ID: <87bnwqv075.fsf@kamboji.qca.qualcomm.com>
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
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> FW stats does provide the Rx rate information. Add this.
> Tested with firmware 10x firmware.
>
> Increase buffer size so more peers can be shown.
>
> Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>
> v2:  Re-work Chun-Yeow's patch to hopefully be backwards compat
>      with pre 10.x firmware.  I tested on modified 10x firmware.

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
