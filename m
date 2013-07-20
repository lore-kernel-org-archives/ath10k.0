Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V0QFI-0000RN-8h
 for ath10k@lists.infradead.org; Sat, 20 Jul 2013 06:02:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 3/3] ath10k: create debugfs interface to trigger fw
 crash
References: <1372148011-28234-1-git-send-email-michal.kazior@tieto.com>
 <1373961277-14784-1-git-send-email-michal.kazior@tieto.com>
 <1373961277-14784-4-git-send-email-michal.kazior@tieto.com>
 <87zjti4zc5.fsf@kamboji.qca.qualcomm.com>
Date: Sat, 20 Jul 2013 09:01:46 +0300
In-Reply-To: <87zjti4zc5.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Fri, 19 Jul 2013 13:29:46 +0300")
Message-ID: <878v1122id.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

>> +static ssize_t ath10k_write_simulate_fw_crash(struct file *file,
>> +					      const char __user *user_buf,
>> +					      size_t count, loff_t *ppos)
>> +{
>> +	struct ath10k *ar = file->private_data;
>> +	char buf[32] = {};
>> +	int ret;
>> +
>> +	mutex_lock(&ar->conf_mutex);
>> +
>> +	simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
>> +	if (strcmp(buf, "crash") && strcmp(buf, "crash\n")) {
>> +		ath10k_warn("write keyword `crash` to simulate firmware crash\n");
>> +		goto exit;
>> +	}
>
> Better to just return an error here.
>
>> +	if (ar->state != ATH10K_STATE_ON &&
>> +	    ar->state != ATH10K_STATE_RESTARTED) {
>> +		ath10k_warn("firmware isn't loaded yet, nothing to crash\n");
>> +		goto exit;
>> +	}
>
> Ditto.

Sorry, I was unclear here. I also meant that the two ath10k_warn() calls
should be removed.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
