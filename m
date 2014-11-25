Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtBxh-0000zA-TP
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 08:59:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k: fix station count enforcement
References: <1416834909-7130-1-git-send-email-michal.kazior@tieto.com>
 <1416834909-7130-3-git-send-email-michal.kazior@tieto.com>
 <87d28b3dzg.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmf6+U20083pHxMdDPMDZf=MNoup+CxBTn=azLZupQYPw@mail.gmail.com>
Date: Tue, 25 Nov 2014 10:58:39 +0200
In-Reply-To: <CA+BoTQmf6+U20083pHxMdDPMDZf=MNoup+CxBTn=azLZupQYPw@mail.gmail.com>
 (Michal Kazior's message of "Tue, 25 Nov 2014 09:38:41 +0100")
Message-ID: <87ioi31wsg.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

>>>  int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
>>>  {
>>>       int status;
>>> @@ -939,6 +950,8 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
>>>       else
>>>               ar->free_vdev_map = (1LL << TARGET_NUM_VDEVS) - 1;
>>>
>>> +     ath10k_core_init_max_sta_count(ar);
>>
>> I don't see the need to call this during every firmware start as these
>> are not changed afterwards. I think it would be better to call this once
>> just after ath10k_core_fetch_firmware_files() is called.
>
> Hmm.. It makes sense but now that I think about it the max number of
> peers should actually depend on WMI_SERVICE_IRAM_TIDS which is known
> after booting firmware. However since only 10.x was released with the
> service enabled we used fw_features. So..

I think this is good enough for now. We can always improve this later.

> yeah. I can move the function call if you want though.

Please do that. To keep things simple I would like to have the absolute
minimum in start() calls.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
