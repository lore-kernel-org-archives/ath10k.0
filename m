Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHPVi-0005Wz-5Z
 for ath10k@lists.infradead.org; Sat, 12 May 2018 08:04:11 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 6/9] firmware: print firmware name on fallback path
References: <20180423201205.20533-1-andresx7@gmail.com>
 <20180423201205.20533-7-andresx7@gmail.com>
 <20180503234235.GX27853@wotan.suse.de>
Date: Sat, 12 May 2018 11:03:52 +0300
In-Reply-To: <20180503234235.GX27853@wotan.suse.de> (Luis R. Rodriguez's
 message of "Thu, 3 May 2018 23:42:35 +0000")
Message-ID: <8736yxb8rb.fsf@codeaurora.org>
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
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: arend.vanspriel@broadcom.com, Kees Cook <keescook@chromium.org>, gregkh@linuxfoundation.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, hdegoede@redhat.com, Andres Rodriguez <andresx7@gmail.com>, alexdeucher@gmail.com, Mimi Zohar <zohar@linux.vnet.ibm.com>, christian.koenig@amd.com

(sorry for the delay, this got buried in my inbox)

"Luis R. Rodriguez" <mcgrof@kernel.org> writes:

> On Mon, Apr 23, 2018 at 04:12:02PM -0400, Andres Rodriguez wrote:
>> Previously, one could assume the firmware name from the preceding
>> message: "Direct firmware load for {name} failed with error %d".
>> 
>> However, with the new firmware_request_nowarn() entrypoint, the message
>> outlined above will not always be printed.
>
> I though the whole point was to not print an error message. What if
> we want later to disable this error message? This would prove a bit
> pointless.
>
> Let's discuss the exact semantics desired here. Why would only the
> fallback be desirable here?
>
> Andres, Kalle?

So from ath10k point of view we do not want to have any messages printed
when calling firmware_request_nowarn(). The warnings get users really
confused when ath10k is checking if an optional firmware file is
available or not.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
