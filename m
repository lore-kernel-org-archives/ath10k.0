Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1duFFs-0002aL-BO
 for ath10k@lists.infradead.org; Tue, 19 Sep 2017 09:55:57 +0000
Received: by mail-wm0-x22a.google.com with SMTP id e71so3587359wmg.4
 for <ath10k@lists.infradead.org>; Tue, 19 Sep 2017 02:55:27 -0700 (PDT)
Subject: Re: [TDLS PATCH V3 1/5] mac80211: Enable TDLS peer buffer STA feature
References: <TDLS for ath10k patchset v3>
 <1505790913-28377-1-git-send-email-yintang@qti.qualcomm.com>
 <1505790913-28377-2-git-send-email-yintang@qti.qualcomm.com>
 <db428527-cb2b-5136-24c2-be2fca9e2407@broadcom.com>
 <1505808914.3026.0.camel@sipsolutions.net>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <06857e7e-5ec1-b0b7-7320-42690e852658@broadcom.com>
Date: Tue, 19 Sep 2017 11:55:24 +0200
MIME-Version: 1.0
In-Reply-To: <1505808914.3026.0.camel@sipsolutions.net>
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>, yintang@qti.qualcomm.com, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 19-09-17 10:15, Johannes Berg wrote:
> On Tue, 2017-09-19 at 09:56 +0200, Arend van Spriel wrote:
>>
>>> --- a/include/net/cfg80211.h
>>> +++ b/include/net/cfg80211.h
>>> @@ -3249,6 +3249,8 @@ struct cfg80211_ops {
>>>     *	beaconing mode (AP, IBSS, Mesh, ...).
>>>     * @WIPHY_FLAG_HAS_STATIC_WEP: The device supports static WEP key
>>> installation
>>>     *	before connection.
>>> + * @WIPHY_FLAG_SUPPORT_TDLS_BUFFER_STA: Device support buffer STA
>>> when TDLS is
>>> + *	established.
>>
>> If I am not mistaken no new wiphy flags are supposed to be added.
>> Although this might be something not reported to user-space, right?
>> Have  a look at struct wiphy::ext_features.
> 
> I guess it should just be a HW flag in mac80211? Not sure why userspace
> even needs to know.

Indeed seems specific to stack functionality in mac80211.

Regards,
Arend

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
