Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XS1nX-0001Mt-Tg
 for ath10k@lists.infradead.org; Thu, 11 Sep 2014 10:40:20 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4 2/2] ath10k: add testmode
References: <20140910152136.12610.18499.stgit@potku.adurom.net>
 <20140910152329.12610.41409.stgit@potku.adurom.net>
 <CA+BoTQkBiKPzHBfTA2xpmgbUbutSj5Z6w6gP7EO6aotacM5_cA@mail.gmail.com>
Date: Thu, 11 Sep 2014 13:39:41 +0300
In-Reply-To: <CA+BoTQkBiKPzHBfTA2xpmgbUbutSj5Z6w6gP7EO6aotacM5_cA@mail.gmail.com>
 (Michal Kazior's message of "Thu, 11 Sep 2014 11:47:34 +0200")
Message-ID: <87ppf230gi.fsf@kamboji.qca.qualcomm.com>
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

> On 10 September 2014 17:23, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> [...]
>
> Just a small nitpick:
>
>> +static int ath10k_tm_cmd_utf_stop(struct ath10k *ar, struct nlattr *tb[])
>> +{
>> +       int ret;
>> +
>> +       ath10k_dbg(ar, ATH10K_DBG_TESTMODE, "testmode cmd utf stop\n");
>> +
>> +       mutex_lock(&ar->conf_mutex);
>> +
>> +       if (ar->state != ATH10K_STATE_UTF) {
>> +               ret = -ENETDOWN;
>> +               goto out;
>> +       }
>> +
>> +       __ath10k_tm_cmd_utf_stop(ar);
>> +
>> +       ar->state = ATH10K_STATE_OFF; // <-- this
>
> I would move it to __ath10k_tm_cmd_utf_stop() itself so that the state
> is reset in ath10k_testmode_destroy() as well.

Ok. It doesn't make any difference on the functionality, but I'll change
it anyway. I folded this patch to the commit:

diff --git a/drivers/net/wireless/ath/ath10k/testmode.c b/drivers/net/wireless/ath/ath10k/testmode.c
index 9d77d72042ff..483db9cb8c96 100644
--- a/drivers/net/wireless/ath/ath10k/testmode.c
+++ b/drivers/net/wireless/ath/ath10k/testmode.c
@@ -253,6 +253,8 @@ static void __ath10k_tm_cmd_utf_stop(struct ath10k *ar)
 
        release_firmware(ar->testmode.utf);
        ar->testmode.utf = NULL;
+
+       ar->state = ATH10K_STATE_OFF;
 }
 
 static int ath10k_tm_cmd_utf_stop(struct ath10k *ar, struct nlattr *tb[])
@@ -270,7 +272,6 @@ static int ath10k_tm_cmd_utf_stop(struct ath10k *ar, struct nlattr *tb[])
 
        __ath10k_tm_cmd_utf_stop(ar);
 
-       ar->state = ATH10K_STATE_OFF;
        ret = 0;
 
        ath10k_info(ar, "UTF firmware stopped\n");

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
