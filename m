Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjn3m-0001Se-PX
 for ath10k@lists.infradead.org; Tue, 13 Sep 2016 12:43:35 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Spelling and miscellaneous neatening
Date: Tue, 13 Sep 2016 12:43:09 +0000
Message-ID: <871t0oj7hf.fsf@kamboji.qca.qualcomm.com>
References: <95a6b65277914d88178ed2b15e182455067cca60.1472490319.git.joe@perches.com>
In-Reply-To: <95a6b65277914d88178ed2b15e182455067cca60.1472490319.git.joe@perches.com>
 (Joe Perches's message of "Mon, 29 Aug 2016 10:05:51 -0700")
Content-Language: en-US
Content-ID: <8382662410357845AE0CE0EAA6DBD7A6@qualcomm.com>
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
To: Joe Perches <joe@perches.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Joe Perches <joe@perches.com> writes:

> Correct some trivial comment typos.
> Remove unnecessary parentheses in a long line.
> Convert a return; before the end of a void function definition to just ;
>
> Signed-off-by: Joe Perches <joe@perches.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2118,7 +2118,7 @@ err:
>  	/* TODO: It's probably a good idea to release device from the driver
>  	 * but calling device_release_driver() here will cause a deadlock.
>  	 */
> -	return;
> +	;
>  }

I don't think this improves anything, I dropped this part from the patch
in my pending branch.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
