Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezaD-0008DF-KE
 for ath10k@lists.infradead.org; Wed, 31 Aug 2016 07:05:14 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv3 1/3] ath10k: move firmware_swap_code_seg_info to
 ath10k_fw_file
Date: Wed, 31 Aug 2016 07:04:42 +0000
Message-ID: <87poop4dx2.fsf@kamboji.qca.qualcomm.com>
References: <1467356767-31646-1-git-send-email-c_traja@qti.qualcomm.com>
 <CAGRGNgWd-5ef5bxOkthpfH1hjqO4HJuWuBA=jNRAr=geQDH1zA@mail.gmail.com>
In-Reply-To: <CAGRGNgWd-5ef5bxOkthpfH1hjqO4HJuWuBA=jNRAr=geQDH1zA@mail.gmail.com>	(Julian
 Calaby's message of "Mon, 4 Jul 2016 10:49:55 +1000")
Content-Language: en-US
Content-ID: <7C404886E6E015418BA390AA4BD06BA7@qualcomm.com>
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
To: Julian Calaby <julian.calaby@gmail.com>
Cc: "Raja, Tamizh Chelvam" <c_traja@qti.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "tamizhchelvam@codeaurora.org" <tamizhchelvam@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Julian Calaby <julian.calaby@gmail.com> writes:

> Hi Tamizh,
>
> On Fri, Jul 1, 2016 at 5:06 PM,  <c_traja@qti.qualcomm.com> wrote:
>> From: Tamizh chelvam <c_traja@qti.qualcomm.com>
>>
>> Preparation to make use of firmware_swap_code_seg_info for UTF binary.
>>
>> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/core.c |    6 +++---
>>  drivers/net/wireless/ath/ath10k/core.h |    6 ++----
>>  drivers/net/wireless/ath/ath10k/swap.c |   26 ++++++++++++++------------
>>  drivers/net/wireless/ath/ath10k/swap.h |   11 ++++++++---
>>  4 files changed, 27 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
>> index 3da18c9..e69e7e7 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.h
>> +++ b/drivers/net/wireless/ath/ath10k/core.h
>> @@ -654,6 +654,8 @@ struct ath10k_fw_file {
>>
>>         const void *codeswap_data;
>>         size_t codeswap_len;
>> +       /* FIXME: add a comment */
>> +       struct ath10k_swap_code_seg_info *firmware_swap_code_seg_info;
>
> Why not just add a comment? Adding FIXMEs makes the patch look incomplete to me.

Actually I'm here to blame, I asked Tamizh to add the fixme so I can add
a proper comment. I did it now:

--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -663,7 +663,14 @@ struct ath10k_fw_file {
 
        const void *codeswap_data;
        size_t codeswap_len;
-       /* FIXME: add a comment */
+
+       /* The original idea of struct ath10k_fw_file was that it only
+        * contains struct firmware and pointers to various parts (actual
+        * firmware binary, otp, metadata etc) of the file. This seg_info
+        * is actually created separate but as this is used similarly as
+        * the other firmware components it's more convenient to have it
+        * here.
+        */
        struct ath10k_swap_code_seg_info *firmware_swap_code_seg_info;
 };

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
