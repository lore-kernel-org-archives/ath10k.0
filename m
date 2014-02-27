Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22d.google.com ([2a00:1450:4010:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIuqM-0002W2-MV
 for ath10k@lists.infradead.org; Thu, 27 Feb 2014 06:53:19 +0000
Received: by mail-la0-f45.google.com with SMTP id hr17so1390289lab.32
 for <ath10k@lists.infradead.org>; Wed, 26 Feb 2014 22:52:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87a9ddlrqm.fsf@kamboji.qca.qualcomm.com>
References: <1393311399-8070-1-git-send-email-janusz.dziedzic@tieto.com>
 <87a9ddlrqm.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 27 Feb 2014 07:52:54 +0100
Message-ID: <CALhHN=pgPNT4EktfMkQNiS_qa2uXDq9BBovzq6YPEurEEHMqDg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: skip management frames in HTT path
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 26 February 2014 18:16, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>
>> After we pass frames with INV_PEER to upper layer in patch:
>>
>> ath10k: pass frames with invalid peer status to upper layer
>>
>> we could pass some management frames (in case INVALID_PEER
>> and MGMT_CTRL) twice to upper layer, once via WMI and once
>> via HTT. Next we could handle assoc request twice. This
>> patch remove such regression.
>>
>> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>
> I saw a conflict and also did some commit log cleanup. Please check:
>
> https://github.com/kvalo/ath/commit/dd0063fba4434d22fb8a6e6d79bf23cc36f6916a
>
looks good.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
