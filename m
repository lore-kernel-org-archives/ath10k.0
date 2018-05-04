Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEO95-0007Kw-UE
 for ath10k@lists.infradead.org; Fri, 04 May 2018 00:00:21 +0000
Date: Fri, 4 May 2018 00:00:06 +0000
From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH 5/9] firmware: add function to load firmware without
 warnings v5
Message-ID: <20180504000006.GO27853@wotan.suse.de>
References: <20180423201205.20533-1-andresx7@gmail.com>
 <20180423201205.20533-6-andresx7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180423201205.20533-6-andresx7@gmail.com>
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
To: Andres Rodriguez <andresx7@gmail.com>
Cc: arend.vanspriel@broadcom.com, Kees Cook <keescook@chromium.org>, gregkh@linuxfoundation.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, hdegoede@redhat.com, mcgrof@kernel.org, alexdeucher@gmail.com, Mimi Zohar <zohar@linux.vnet.ibm.com>, christian.koenig@amd.com, kvalo@codeaurora.org

On Mon, Apr 23, 2018 at 04:12:01PM -0400, Andres Rodriguez wrote:
> diff --git a/include/linux/firmware.h b/include/linux/firmware.h
> index db8351a42405..a34e16f77f20 100644
> --- a/include/linux/firmware.h
> +++ b/include/linux/firmware.h
> @@ -42,6 +42,8 @@ struct builtin_fw {
>  #if defined(CONFIG_FW_LOADER) || (defined(CONFIG_FW_LOADER_MODULE) && defined(MODULE))
>  int firmware_request(const struct firmware **fw, const char *name,
>  		     struct device *device);
> +int firmware_request_nowarn(const struct firmware **fw, const char *name,
> +			    struct device *device);
>  int firmware_request_nowait(
>  	struct module *module, bool uevent,
>  	const char *name, struct device *device, gfp_t gfp, void *context,

You also missed the firmware_request_nowarn() call on the #else. I'll add it
and re-submit myself.

In future patches about firmware please also Cc Mimi Zohar <zohar@linux.vnet.ibm.com>,
and Kees Cook <keescook@chromium.org>. You can also use the long list (modulo, not
the EFI list) that Hans used on his EFI patches. I realize its long but its just
to ensure enough folks get to review and eybeball the code.

  Luis

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
