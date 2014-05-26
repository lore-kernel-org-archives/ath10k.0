Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WovGz-0007H3-TY
 for ath10k@lists.infradead.org; Mon, 26 May 2014 13:49:06 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Mon, 26 May 2014 15:45:16 +0200
Subject: RE : RE : RE : RE : ath10k: firmware crash in station mode &
 problem DFS
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F109978F0@srvexch01.SODIELEC.local>
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <5370F41A.70202@candelatech.com>
 <CAHqTa-1xYF=eO-Ai5UMF4BuzzLa84SrzayiGZVmt0jaGs5sZDQ@mail.gmail.com>
 <53719332.9040700@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978CC@srvexch01.SODIELEC.local>
 <CA+BoTQmxBHbeu=4si9sCkqtXtY6mBHahktVKoWLCuShecjUytw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978D0@srvexch01.SODIELEC.local>
 <CA+BoTQnsLGHLHjnr+aFm44qwkPQxNcpuCg0oo75iD=QVsh4U7w@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978DA@srvexch01.SODIELEC.local>
 <CA+BoTQnKrBWBUtdw4YB8GQPu5VZuZNc7OgwT5v5_qp=zOqxd_A@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978DD@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978DE@srvexch01.SODIELEC.local>
 <CALhHN=qKpm3RRG9S6UF17c3NZZaid4Zo15e0AACnrEgb0f-aqg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978DF@srvexch01.SODIELEC.local>
 <CALhHN=r0vg3hf+pozRQujmCzYXb7g2YX8Ur-bQ_HQ0-qd=yRAg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978E1@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978E5@srvexch01.SODIELEC.local>
 <CALhHN=oC4LdH0vr31dAZpvFLjZnJJ_Bg2d=pnCved6TKAmwi0A@mail.gmail.com>
 <CALhHN=rw7=nm8ZoMVm1u=nVou1OLY30jUq0G6LvA861Yrknn_Q@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978E6@srvexch01.SODIELEC.local>
 <87lhttwyos.fsf@kamboji.qca.qualcomm.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978E8@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978E9@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978EA@srvexch01.SODIELEC.local>,
 <CALhHN=qsgcL04x+vsXgmHnSr5H-aoQW7oC5Y+NmCZCLS1DWGAQ@mail.gmail.com>
In-Reply-To: <CALhHN=qsgcL04x+vsXgmHnSr5H-aoQW7oC5Y+NmCZCLS1DWGAQ@mail.gmail.com>
Content-Language: fr-FR
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "kvalo@qca.qualcomm.com" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>Thanks for logs.
>Seems hostapd get probe request and try to send probe responses but
>using monitor interface - driver never get this frame.
>Seems you have set use_monitor=1 in hostapd - why? Did you hack/overwrie this?
>ath10k don't need dedicated monitor interface for AP mode.

Thank you for your response, I don't set that parameter in hostapd file and even in the example file of hostapd.conf, I don't see that parameter. Here is my hostapd.conf:

interface=wlan0                                                                 
driver=nl80211                                                                  
bridge=br0                                                                      
country_code=FR                                                                 
ieee80211d=1                                                                    
ieee80211h=1                                                                    
hw_mode=a                                                                       
ieee80211n=1                                                                    
wds_sta=1                                                                       
ht_capab=[HT40+][SMPS-STATIC][TX-STBC][RX-STBC1][MAX-AMSDU-7935][DSSS_CCK-36]   
channel=52                                                                      
rts_threshold=2347                                                              
beacon_int=100                                                                  
wmm_enabled=1                                                                   
logger_syslog=-1                                                                
logger_syslog_level=0                                                           
logger_stdout=-1                                                                
logger_stdout_level=2                                                           
ctrl_interface_group=0                                                          
macaddr_acl=0                                                                   
auth_algs=1                                                                     
eapol_key_index_workaround=0                                                    
eapol_version=1                                                                 
eap_server=0                                                                    
ssid=ath10k                                                                     
wpa=0                                                                           
wpa_key_mgmt=WPA-PSK                                                            
wpa_passphrase=password                                           
wpa_group_rekey=86360        

But as you said, when I run hostapd (with option -dd) I saw this output: 
nl80211: Setup AP(wlan0) - device_ap_sme=0 use_monitor=1 
It means that parameter is set automatically by the driver nl80211?. And I guess that hostapd do that itself.
Do you know why or can you show me how to set that parameter off to do a test?


NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
