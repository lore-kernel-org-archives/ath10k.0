Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcY9q-0001kR-PK
 for ath10k@lists.infradead.org; Mon, 30 Mar 2015 11:47:07 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix HTT op backwards compatibility for QCA6174
References: <20150330111428.22198.36611.stgit@potku.adurom.net>
 <CA+BoTQ=s4M9jt46ta1OKp0vAG6wZvZmbBjPU_kmJYr3F6zuB1A@mail.gmail.com>
Date: Mon, 30 Mar 2015 14:46:35 +0300
In-Reply-To: <CA+BoTQ=s4M9jt46ta1OKp0vAG6wZvZmbBjPU_kmJYr3F6zuB1A@mail.gmail.com>
 (Michal Kazior's message of "Mon, 30 Mar 2015 13:25:56 +0200")
Message-ID: <87lhie6738.fsf@kamboji.qca.qualcomm.com>
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

> On 30 March 2015 at 13:14, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Commit 8348db298496 ("ath10k: add ATH10K_FW_IE_HTT_OP_VERSION") broke QCA6174
>> receive side as the HTT ids from ATH10K_FW_HTT_OP_VERSION_MAIN don't have
>> HTT_TLV_T2H_MSG_TYPE_RX_IN_ORD_PADDR_IND set. Fix this by adding a backwards
>> compatibility code which sets HTT op version if it's not set by the firmare
>
> s/firmare/firmware/

Fixed.

>> image.
>>
>> Fixes: 8348db298496 ("ath10k: add ATH10K_FW_IE_HTT_OP_VERSION")
>> Reported-by: Michal Kazior <michal.kazior@tieto.com>
>> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>
> Tested-by: Michal Kazior <michal.kazior@tieto.com>

Thanks! And sorry for this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
