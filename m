Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1acrbG-00033B-Ip
 for ath10k@lists.infradead.org; Mon, 07 Mar 2016 09:37:33 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 07/11] ath10k: implement wake_tx_queue
Date: Mon, 7 Mar 2016 09:36:50 +0000
Message-ID: <87mvqavdcl.fsf@kamboji.qca.qualcomm.com>
References: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
 <1456828376-2795-1-git-send-email-michal.kazior@tieto.com>
 <1456828376-2795-8-git-send-email-michal.kazior@tieto.com>
 <87ziubvfzm.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQm=vskz3WhSZjQcMLscWEs4NVoM37hpoYHMiaQb0fYyAw@mail.gmail.com>
In-Reply-To: <CA+BoTQm=vskz3WhSZjQcMLscWEs4NVoM37hpoYHMiaQb0fYyAw@mail.gmail.com>	(Michal
 Kazior's message of "Mon, 7 Mar 2016 07:04:16 +0100")
Content-Language: en-US
Content-ID: <C69128F2DC178947AF713BE815BFA19B@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 6 March 2016 at 15:27, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> This implements very basic support for software
>>> queueing. It also contains some knobs that will be
>>> patched later.
>>>
>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>
>> Oddly this patch introduces a new warning:
>>
>> drivers/net/wireless/ath/ath10k/mac.c: In function ath10k_mac_op_tx:
>> drivers/net/wireless/ath/ath10k/mac.c:3949:29: warning: is_mgmt may be used uninitialized in this function [-Wuninitialized]
>>
>> But I think that's just a false warning, most likely because my gcc is
>> ancient. Do you agree?
>
> Yes, I agree. It must be the fact is_mgmt is set/used across two
> is_htt condition branches.
>
>
>> gcc (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3
>
> gcc (Debian 4.9.2-10) 4.9.2 -- no warning for me.

Actually kbuild also found this but let's just ignore it.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
