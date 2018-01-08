Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYX1G-0003Xf-Rx
 for ath10k@lists.infradead.org; Mon, 08 Jan 2018 12:59:16 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 03/11] ath10k_sdio: DMA bounce buffers for read write
Date: Mon, 8 Jan 2018 12:58:52 +0000
Message-ID: <87mv1o4id1.fsf@kamboji.qca.qualcomm.com>
References: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
 <1506793068-27445-4-git-send-email-alagusankar@silex-india.com>
 <87lghu9247.fsf@kamboji.qca.qualcomm.com>
 <5281f48b04f8f593ec06e72a041ec021@silex-india.com>
In-Reply-To: <5281f48b04f8f593ec06e72a041ec021@silex-india.com> (Alagu
 Sankar's message of "Mon, 25 Dec 2017 17:56:50 +0530")
Content-Language: en-US
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
To: Alagu Sankar <alagusankar@silex-india.com>
Cc: "silexcommon@gmail.com" <silexcommon@gmail.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Alagu Sankar <alagusankar@silex-india.com> writes:

> On 2017-12-22 21:38, Kalle Valo wrote:
>> silexcommon@gmail.com writes:
>>
>>> From: Alagu Sankar <alagusankar@silex-india.com>
>>>
>>> Some SD host controllers still need bounce buffers for SDIO data
>>> transfers. While the transfers worked fine on x86 platforms,
>>> this is found to be required for i.MX6 based systems.
>>>
>>> Changes are similar to and derived from the ath6kl sdio driver.
>>>
>>> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
>>
>> Why is the bounce buffer needed exactly, what are the symptoms etc? To
>> me this sounds like an ugly workaround for a SDIO controller driver
>> bug.
>
> We faced problems with i.MX6. The authentication frame sent by the
> driver never reached the air. The host driver accepted the buffer, but
> did not send out the packet to the sdio module. No errors reported
> anywhere, but the buffer is not accepted due to alignment.

So what kind of alignment works with i.MX6 and how are the packets
aligned by ath10k? Of course, this might be still a bug in ath10k but
most likely it's elsewhere and should be properly investigated. There
must be a much better approach to handle this problem.

> The same driver however works fine without bounce buffer on x86
> platform with stdhci drivers. To make it compliant with all host
> controllers, we introduced the bounce buffers, similar to what was
> done in ath6kl_sdio drivers.

That bounce buffer was horrible in ath6kl and with the bounce buffer you
are forcing all working platforms to suffer from a copy of every packet.
And ath10k is getting so complex that we really need to keep the code as
simple as possible to keep it maintainable.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
