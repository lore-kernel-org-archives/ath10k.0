Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XW2PY-0005n0-8n
 for ath10k@lists.infradead.org; Mon, 22 Sep 2014 12:08:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/3] ath10k: dump hex bytes with dev string prefix
References: <1411046721-20510-1-git-send-email-michal.kazior@tieto.com>
 <1411046721-20510-3-git-send-email-michal.kazior@tieto.com>
 <877g0wlyga.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQm1_X992b_fMokcpuuqooQFThHpQoAEe4cjzOu7P3CV1A@mail.gmail.com>
Date: Mon, 22 Sep 2014 15:07:35 +0300
In-Reply-To: <CA+BoTQm1_X992b_fMokcpuuqooQFThHpQoAEe4cjzOu7P3CV1A@mail.gmail.com>
 (Michal Kazior's message of "Mon, 22 Sep 2014 14:03:48 +0200")
Message-ID: <8738bjn9iw.fsf@kamboji.qca.qualcomm.com>
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

> On 22 September 2014 12:52, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> -             print_hex_dump_bytes(prefix, DUMP_PREFIX_OFFSET, buf, len);
>>> +             for (ptr = buf; (ptr - buf) < len; ptr += 16) {
>>> +                     linebuflen = 0;
>>> +                     if (prefix)
>>> +                             linebuflen += scnprintf(linebuf + linebuflen,
>>> +                                                     sizeof(linebuf) -
>>> +                                                     linebuflen,
>>> +                                                     "%s", prefix);
>>> +                     linebuflen += scnprintf(linebuf + linebuflen,
>>> +                                             sizeof(linebuf) - linebuflen,
>>> +                                             "%08x: ",
>>> +                                             (unsigned int)(ptr - buf));
>>> +                     hex_dump_to_buffer(ptr, len - (ptr - buf), 16, 1,
>>> +                                        linebuf + linebuflen,
>>> +                                        sizeof(linebuf) - linebuflen, true);
>>> +                     dev_printk(KERN_DEBUG, ar->dev, "%s\n", linebuf);
>>> +             }
>>
>> Would it be possible to simplify this to one scnprintf()? Something
>> like:
>>
>> linebuflen += scnprintf(linebuf + linebuflen,
>>                         sizeof(linebuf) - linebuflen,
>>                         "%s%08x: ",
>>                         prefix ? prefix : "",
>>                         (unsigned int)(ptr - buf));
>
> It should be fine. You want me to re-send it?

Yes, that would be good. I don't feel comfortable editing patches with
logic changes like this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
