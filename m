Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2dxP-0005gL-Cc
 for ath10k@lists.infradead.org; Tue, 17 May 2016 12:18:40 +0000
Received: by mail-wm0-x232.google.com with SMTP id a17so27650118wme.0
 for <ath10k@lists.infradead.org>; Tue, 17 May 2016 05:18:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4e407b2c-29f9-3c74-ea94-4206632441c3@dd-wrt.com>
References: <CA+uUJGtXNAe=FRgYTVDNf6aNVE78CMSs+gLj-bQgA_=hFZibaA@mail.gmail.com>
 <57320C1A.3040604@candelatech.com>
 <CA+uUJGukss2Z7i=k0OvERWvkzMGwBFTaY6R_TL5sGo4yXKQFsA@mail.gmail.com>
 <57335A43.4050902@candelatech.com>
 <CA+uUJGsVi0OiwK4D6n-ANXRm6ptiTdjvKNboXobwn4FA0YfsRQ@mail.gmail.com>
 <573892F5.40706@candelatech.com> <5738AE96.8040800@candelatech.com>
 <CA+uUJGuMrDoXat3rD2AeHTLZUCUDPHXhHVy==62mGLN01O8Vdw@mail.gmail.com>
 <87mvnp6ser.fsf@kamboji.qca.qualcomm.com>
 <572a14ee-d1b5-7b85-d292-51f583f34f17@dd-wrt.com>
 <CA+BoTQkhrvS3Vz_CnDFGVdRwt=XJgrAF1oTRvyEz+96r48bjfQ@mail.gmail.com>
 <4e407b2c-29f9-3c74-ea94-4206632441c3@dd-wrt.com>
Date: Tue, 17 May 2016 14:18:17 +0200
Message-ID: <CA+BoTQnopmxAQaWCyNvy20uWB65F=pMcoQ9Pz4LNWo3VGBMpHg@mail.gmail.com>
Subject: Re: QCA9984 VHT160 support
From: Michal Kazior <michal.kazior@tieto.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

+ re-adding ath10k list


On 17 May 2016 at 14:05, Sebastian Gottschall <s.gottschall@dd-wrt.com> wrote:
>Am 17.05.2016 um 14:00 schrieb Michal Kazior:
>> On 17 May 2016 at 13:43, Sebastian Gottschall <s.gottschall@dd-wrt.com> wrote:
>>> Attached you will find a testing patch for VHT160 support. i tested it today
>>> on a QCA9984 device and it seems to work.
>>> feel free to make any corrections
>> Hi,
>>
>> Send patches inline, please. Preferably via git send-email. It's a lot
>> easier to review them this way.
> unfortunaty i dont work with git right now and i wanted to send it to
> the list first for getting comments.
> since the patch is also very small, it should be that complicated
>>
>>  From a quick glance vht capabilities setup looks weird:
>>
>>> if (ar->vht_cap_info &  IEEE80211_VHT_CAP_SHORT_GI_160) {
>>>    vht_cap.cap |= IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ;
>>>    vht_cap.cap |= IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ;
>>> }
>> Why? Is this really necessary?
> the firmware does not report correct flags. just SHORT_GI_160.
> i reviewed the firmware sourcecodes and found out that this is maybe a
> misstake of the QCA developers.
> so we need to add the 160MHZ support flags locally using the
> SHORT_GI_160 which is always set on QCA9984.
> otherwise mac80211 will not be capable of running vht160.

I'm not sure if SGI160 implies 80+80.


>> I would expect IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ and
>> IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ to be already set in
>> ar->vht_cap_info if the chip supports 160 or 80+80.
>me too. but it isnt :-)

Sigh. A comment explaining that would be really nice.


>> You also don't seem to handle 80+80 because you just as phymode to 160
>> regardless of center frequencies:
>>
>>> !ath10k_peer_assoc_h_vht_masked(vht_mcs_mask)) {
>>>     if (sta->bandwidth == IEEE80211_STA_RX_BW_80)
>>>       phymode = MODE_11AC_VHT80;
>>>     else if (sta->bandwidth == IEEE80211_STA_RX_BW_160)
>>>       phymode = MODE_11AC_VHT160;
>>>     else if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
>>>       phymode = MODE_11AC_VHT40;
>>>     else if (sta->bandwidth == IEEE80211_STA_RX_BW_20)
> there is no 80+80 STA_RX_BW flag. i dont know how to handle this. and
> yes, just 160 mhz is tested right now. right now it looks like mac80211
> is not 80+80 ready.

Hmm.. I wouldn't advertise 80+80 support then. All the more since
there's no way of telling whether hw/fw actually supports it in the
first place.


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
